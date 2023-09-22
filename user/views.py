from main.models import User
from django.shortcuts import render, redirect, reverse
from django.http import HttpResponse
from django.contrib.auth import login, authenticate, logout
from .forms import UserAuthenticationForm
from .models import Wishes, CartItem, ProfileLike, MailingList, userCategoryPreferences
from user.models import UserReport
from chat.models import Message
from main.models import User, Item, UserInfo, Category
from user.forms import RegistrationForm
from django.contrib.auth import authenticate, login
from django.core.files.storage import FileSystemStorage
from django.core.mail import send_mail, EmailMultiAlternatives
from django.template.loader import render_to_string
from django.core.paginator import Paginator
from django.contrib.auth.decorators import login_required
from social_django.utils import psa
import json
import os
from urllib.parse import unquote


def updateProfileImage(request):

    if request.method == 'POST' and request.FILES['image']:
        me = request.user
        def update_profile_image_location():
            me.profile_image = 'user/profile_images/'+ me.username + '/' + uploaded_image.name
            me.save()


        uploaded_image = request.FILES['image']
        path = 'media/user/profile_images/' + me.username + '/'
        if os.path.exists(path):
            with open(path + uploaded_image.name, 'wb+') as destination:
                for chunk in uploaded_image.chunks():
                    destination.write(chunk)
            
            update_profile_image_location()


        else:
            os.makedirs(path)
            with open(path + uploaded_image.name, 'wb+') as destination:
                for chunk in uploaded_image.chunks():
                    destination.write(chunk)

            update_profile_image_location()

        return redirect('profile')

def profile_settings_view(request):

    me = request.user
    
    if request.method == 'POST':
        
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        username = request.POST.get('username')
        email = request.POST.get('email')
        phone_number = request.POST.get('phone_number')
        country = request.POST.get('country')
        city = request.POST.get('city')
        address = request.POST.get('address')
        shop_location = request.POST.get('shop_location')
        user = request.user
        userInfo = UserInfo.objects.get(user=user)

        user.first_name = first_name
        user.last_name = last_name
        user.username = username
        user.email = email
        userInfo.phone_number = phone_number
        userInfo.country = country
        userInfo.city = city
        userInfo.address = address
        userInfo.shop_location = shop_location

        try:
            userInfo.save()
            user.save()
        except:
            return render(request, 'profile-settings.html', {'me':me, 'userInfo':userInfo, 'errorMessages': 'Username of Email already taken!'})

    try:
        userInfo = UserInfo.objects.filter(user=request.user).first()
    except:
        userInfo = ""

    if me.is_authenticated:
        return render(request, 'profile-settings.html', {'me':me, 'userInfo':userInfo, 'errorMessages': ''})
    else:
        return redirect(reverse('login'))




def registerView(request, *args, **kwargs):
    user = request.user
    if user.is_authenticated:
        return HttpResponse(f"You are already authenticated as {user.email}.")
    context = {}


    if request.POST:
        form = RegistrationForm(request.POST)
        if form.is_valid():
            form.save()
            email = form.cleaned_data.get('email').lower()
            raw_password = form.cleaned_data.get('password1')
            account = authenticate(email=email, password=raw_password)
            login(request, account)
            destination = get_redirect_if_exists(request)


            sendEmailVerification(request)
            sendChatWelcomeMessage(request)

            if destination:
                return redirect(destination)
            return redirect("home")
        else:
            context['registration_form'] = form


    return render(request, 'register.html', context)


def login_view(request, *args, **kwargs):

    context = {}
    user = request.user
    if user.is_authenticated:
        return redirect("home")

    destination = get_redirect_if_exists(request)
    if request.POST:
        form = UserAuthenticationForm(request.POST)
        if form.is_valid():
            email = request.POST["email"]
            password = request.POST["password"]
            user = authenticate(email=email, password=password)
            if user:
                login(request, user)
                destination = get_redirect_if_exists(request)
                if destination:
                    return redirect(destination)
                return redirect("home")
        else:
            context["login_form"] = form

    return render(request, 'login.html', context)



def get_redirect_if_exists(request):
    redirect = None
    if request.GET:
        if request.GET.get("next"):
            redirect = str(request.GET.get("next"))



def logout_view(request):
    logout(request)
    return redirect("home")


def getCart(request):

    if request.user.is_authenticated:
        user=User.objects.get(id=request.user.id)
        cartItems = CartItem.objects.filter(user=user).filter(is_deleted=0).select_related('item').prefetch_related('item__itemimage_set')
        total_price = 0
        shipping_cost = 0
        for cart_item in cartItems:
            price = cart_item.item.price * cart_item.quantity
            shipping = cart_item.item.shipping_cost
            total_price += price
            shipping_cost += shipping

        total_price_with_shipping = total_price + shipping_cost
        return render(request, 'cart.html', {'cartItems': cartItems, 'total_price':total_price, 'shipping_cost':shipping_cost, 'total_price_with_shipping':total_price_with_shipping})
    else:
        return redirect(reverse('login'))

def addCartItem(request):

    if request.user.is_authenticated:
        item_id = request.POST.get('id', '')
        quantity = request.POST.get('quantity', '')

        cartItem = CartItem(user=request.user, item=Item.objects.get(id=item_id), quantity=quantity)

        cartItem.save()

        return HttpResponse("Item added to cart.")
    else:
        return HttpResponse("You have to log in first!")

def removeCartItem(request):
    
    if request.user.is_authenticated:

        cartItemId = request.POST.get('cartItemId', '')
        cartItem = CartItem.objects.get(id=cartItemId)
        cartItem.is_deleted = 1
        cartItem.save()

        return HttpResponse("Item removed from cart.")
    else:
        return HttpResponse("You have to log in first!")



def wishlist(request):
    if request.user.is_authenticated:
        wishes = Wishes.objects.filter(user_id=request.user.id).filter(is_deleted=0).select_related('item').prefetch_related('item__itemimage_set')
        return render(request, 'wishlist.html', {'wishes': wishes})
    else:
        return redirect(reverse('login'))


def toggleWishlistItem(request):

    item_id = request.POST.get('id', '')
    wish = Wishes.objects.filter(item=Item.objects.get(id=item_id)).filter(user=User.objects.get(id=request.user.id)).filter(is_deleted=0)

    if wish.exists():
        wish = wish.first()
        wish.is_deleted = 1
        wish.save()

        if request.path == '/user/wishlist':
            return redirect(request.path)

        return HttpResponse("Removed")
        
    else:
        wish = Wishes(user=User.objects.get(id=request.user.id),
        item=Item.objects.get(id=item_id))
        wish.save()
        return HttpResponse("Added")



def toggleProfileLike(request):

    user = request.POST.get('id', '')
    user = User.objects.get(id=user)
    profileLike = ProfileLike.objects.filter(user=user, liked_by=request.user, is_deleted=0)

    if profileLike.exists():
        profileLike = profileLike.first()
        profileLike.is_deleted = 1
        profileLike.save()

        if request.path == '/user/wishlist':
            return redirect(request.path)

        return HttpResponse("Removed")
        
    else:
        profileLike = ProfileLike(user=user,
        liked_by=request.user)
        profileLike.save()
        return HttpResponse("Added")


def myItems(request):
    if request.user.is_seller:

        user=User.objects.get(id=request.user.id)
        myItems = Item.objects.filter(seller=user).filter(is_deleted=0).prefetch_related('itemimage_set').order_by('-id')

        paginator = Paginator(myItems, 12)

        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)

        return render(request, 'my-items.html', {'items': page_obj})
    else:
        
        if not request.user.is_authenticated:
            return redirect('login')
        else:
            return redirect('/exceptions/access-denied')


def deleteItem(request):

    item_id = request.POST.get('item_id', '')
    item = Item.objects.get(id=item_id)
   
    item.is_deleted = 1
    item.save()
        
    return HttpResponse("Item Removed!")


def sendEmailVerification(request):

    email = request.user.email
    email_template = 'email/email-verification.html'
    context = {'name': request.user.username}
    email_text = render_to_string(email_template, context)

    try:

        subject = 'Email verification link'
        from_email = 'team@multiverzum.com'
        to_email = email


        html_content = email_text

        msg = EmailMultiAlternatives(subject, html_content, from_email, [to_email])
        msg.attach_alternative(html_content, "text/html")
        msg.send()


        return redirect('/')
    except Exception as e:
        print(e)
        return redirect('/')

def sendChatWelcomeMessage(request):

    welcome_message = Message(
        message="Welcome to multiverzum.com",
        sender=User.objects.get(id=2),
        receiver=request.user
    )

    welcome_message.save()

def updateUserDescription(request):
    description = request.POST.get('description', '')

    request.user.description = description
    request.user.save() 

    return HttpResponse("Description updated!")


def updateCartItemQuantity(request):
    cartItemId = request.POST.get('cartItemId')    
    quantity = request.POST.get('quantity')
    cartItem = CartItem.objects.get(id=cartItemId)
    cartItem.quantity = quantity
    cartItem.save()

    return HttpResponse("Quantity updated!")

def addEmailToMailingList(request):

    try:
        email = request.POST.get("email")
        MailingList.objects.create(email=email)
        sendNewsletterEmailAutoreply(email)
        return HttpResponse("Success")
    except:        
        return HttpResponse("Error while adding email to our newsletter. This email is probably already subscribed.")

@login_required
def confirmAccountRemoval(request):

    if request.method == "POST":
        user = request.user
        user.is_deleted = 1
        user.save()
        logout(request)
        return redirect('home')
    return render(request, 'confirm-account-removal.html')


def saveCategoryPreferenceInfo(request):

    if request.method == "POST":
        
        selectedPreferredCategories = json.loads(request.POST['selectedPreferredCategories'])

        for selectedPreferredCategory in selectedPreferredCategories:
            userCategoryPreferences.objects.create(
                user=request.user,
                category=Category.objects.get(id=selectedPreferredCategory)
            )
        
        request.user.first_visit = 0
        request.user.save()

        return HttpResponse("Success")


def reportUser(request):

    user_reported = User.objects.get(id=request.POST.get('reported_user'))
    report_message = request.POST.get("report_message")

    UserReport.objects.create(
        user_reporting=request.user,
        user_reported=user_reported,
        report_message=report_message
    )

    return HttpResponse("Success")



def sendNewsletterEmailAutoreply(email):

    email_template = 'email/newsletter-subscription-autoreply.html'
    email_text = render_to_string(email_template)

    try:

        subject = 'Email verification link'
        from_email = 'team@multiverzum.com'
        to_email = email


        html_content = email_text

        msg = EmailMultiAlternatives(subject, html_content, from_email, [to_email])
        msg.attach_alternative(html_content, "text/html")
        msg.send()


        return redirect('/')
    except Exception as e:
        print(e)
        return redirect('/')


@psa('social:complete')
def callback_view(request, backend):

    user = request.backend.do_auth(request.GET.get('access_token'))
    access_token = request.GET.get('access_token')
    
    if user:

        existing_user = User.objects.filter(email=user.email).first()
        
        if existing_user:

            login(request, existing_user)
            return redirect('/')
        
        else:

            new_user = User(email=user.email, username=user.email)
            new_user.save()
            
            login(request, new_user)

            sendEmailVerification(request)
            sendChatWelcomeMessage(request)

            return redirect('/')
    
    else:
        return HttpResponse('Authentication Error')