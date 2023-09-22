from django.shortcuts import render, redirect
from .models import Item, User, UserInfo, Order, OrderItem, ItemImage, Category, FAQ, SearchRecommendation
from .models import SupportTicket, ItemComment
from user.models import CartItem, userCategoryPreferences, ItemView
from seller.models import ItemFilter
from django.db.models import Q
from django.http import HttpResponse, JsonResponse
from django.contrib.auth.decorators import login_required
from django.db import transaction
from django.core.mail import send_mail, EmailMultiAlternatives
from django.urls import path
from django.db.models import Count
from urllib.parse import unquote
from django.core.paginator import Paginator
from django.template.loader import render_to_string
from django.utils import timezone
from django.core import serializers
from django.core.serializers import serialize
import json
from .multibot import askMultibot

def error_404(request):
    return render(request, 'exceptions/404.html')

def getHome(request):

    previouslyViewed = None
    preferred_category_ids = None
    recommendedItems = None

    popularItems = Item.objects.filter(is_deleted=0).prefetch_related('itemimage_set').annotate(view_count=Count('itemview')).order_by('-view_count')[:8]
    
    if request.user.is_authenticated:
        
        previouslyViewed = Item.objects.filter(
            itemview__user=request.user,
            is_deleted=0
        ).prefetch_related('itemimage_set').order_by('-itemview__updated_at')[:8]

        preferred_category_ids = userCategoryPreferences.objects.filter(user=request.user).values_list('category_id', flat=True)
        recommendedItems = Item.objects.filter(
            Q(category_id__in=preferred_category_ids) | Q(category__parent_id__in=preferred_category_ids),
            is_deleted=0
        ).prefetch_related('itemimage_set').annotate(view_count=Count('itemview')).order_by('-view_count')[:8]

    top_sellers = User.objects.annotate(num_likes=Count('like_receiver')).order_by('-num_likes')[:4]

    return render(request, 'home.html', {'popularItems': popularItems, 'recommendedItems':recommendedItems, 'top_sellers':top_sellers, 'previouslyViewed':previouslyViewed})


def explore(request):

    categoryItems = Category.objects.filter(parent__isnull=True).filter(is_deleted=0)
    return render(request, 'explore.html', {'categoryItems':categoryItems})

def exploreCategory(request, categoryName):
    while "%20" in categoryName:
        categoryName = categoryName.replace("%20", " ")
    parentCategory = Category.objects.filter(name=categoryName).first()
    subcategories = Category.objects.filter(parent=parentCategory)

    categoryItems = Item.objects.filter(category__in=subcategories).filter(is_deleted=0).prefetch_related('itemimage_set')[:16:1]

    return render(request, 'category.html', {'subcategories': subcategories, 'categoryItems':categoryItems, 'categoryName':categoryName})

def getItem(request, item_id):
    
    itemData = Item.objects.filter(id=item_id).filter(is_deleted=0).first()


    if request.user.is_authenticated:
        item_view, created = ItemView.objects.get_or_create(
            user=request.user,
            item=itemData
        )

        if not created:
            item_view.updated_at = timezone.now()
            item_view.save()

    itemImages = ItemImage.objects.filter(item_id=item_id).filter(is_deleted=0)
    itemViews = ItemView.objects.filter(item=itemData).count()
    itemCategory = Item.objects.filter(id=item_id).values_list('category', flat=True)[0]
    item_filters = ItemFilter.objects.filter(item=itemData, is_deleted=0)
    recommendedItems = Item.objects.filter(category=itemCategory).filter(is_deleted=0).prefetch_related('itemimage_set').annotate(view_count=Count('itemview')).order_by('-view_count')[:8:1]
    moreFromSeller = Item.objects.filter(seller=itemData.seller).filter(is_deleted=0).prefetch_related('itemimage_set').annotate(view_count=Count('itemview')).order_by('-view_count')[:8:1]

    return render(request, 'item.html', {'itemData': itemData, 'recommendedItems': recommendedItems, 'itemImages': itemImages, 'moreFromSeller': moreFromSeller, 'item_filters':item_filters, 'itemViews':itemViews})

   

def getSearchResults(request, search_query):
    
    search_query = unquote(search_query)
    search_terms = search_query.split()

    q_objects = Q(is_deleted=False)

    for term in search_terms:
        if term.startswith('"') and term.endswith('"'):

            term = term[1:-1]
        q_objects &= (
            Q(title__icontains=term) |
            Q(tags__icontains=term) |
            Q(category__name__icontains=term)
        )

    search_result = Item.objects.filter(q_objects).distinct().annotate(view_count=Count('itemview')).order_by('-view_count')
    paginator = Paginator(search_result, 12)

    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    sellers = User.objects.filter(is_seller=1, is_deleted=0, username=search_query)

    return render(request, 'search_results.html', {'items': page_obj, 'sellers':sellers})


def getSearchSuggestions(request):
    search_recommendations = SearchRecommendation.objects.filter(is_deleted=0).values_list('query', flat=True)
    return JsonResponse(list(search_recommendations), safe=False)


def aboutPage(request):
    return render(request, 'about.html')
    
def termsOfService(request):
    return render(request, 'terms-of-service.html')


def privacyPolicy(request):
    return render(request, 'privacy-policy.html')


@login_required
def purchaseItemNow(request, item_id, quantity):

    item = Item.objects.filter(id=item_id).first()
    itemImage = ItemImage.objects.filter(item=item).first()

    if item:
        return render(request, 'confirm-order.html', {'item': item, 'quantity': quantity, 'itemImage': itemImage})
    
    else:
        return redirect('/exceptions/page-not-found')


@transaction.atomic
def sendPurchaseRequest(request):

    if request.method == 'POST':

        quantity = request.POST.get('quantity')
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        phone_number = request.POST.get('phone_number')
        country = request.POST.get('country')
        city = request.POST.get('city')
        state_or_region = request.POST.get('state_or_region')
        address = request.POST.get('address')
        address_2 = request.POST.get('address_2')
        zip_code = request.POST.get('zip_code')

        user = request.user
        user.first_name=first_name
        user.last_name=last_name
        user.save()

        userInfo = UserInfo.objects.get(user=request.user)
        userInfo.phone_number=phone_number
        userInfo.country=country
        userInfo.address=address
        userInfo.address_2=address_2
        userInfo.city=city
        userInfo.zip_code=zip_code
        userInfo.state_or_region = state_or_region
        userInfo.save()

        purchase_items = CartItem.objects.filter(user=request.user, is_deleted=0).select_related('item').prefetch_related('item__itemimage_set')

        if purchase_items.exists():
            order = Order.objects.create(
                customer=request.user
            )

            for purchase_item in purchase_items:
                OrderItem.objects.create(
                    order=order,
                    item=purchase_item.item,
                    quantity=purchase_item.quantity,
                    price=purchase_item.item.price,
                    seller=purchase_item.item.seller
                )
                purchase_item.is_deleted = 1
                purchase_item.save()

                sendPurchaseRequestEmailNotification(request, purchase_item.item.seller)

        else:
            return redirect('/')

        return redirect('/order-tracking/order-success')

 
def featureInDev(request):
    return render(request, 'exceptions/featureInDev.html')


def accessDeniedView(request):
    return render(request, 'exceptions/access-denied-view.html')


def topViewedItems(request):
    
    items = Item.objects.filter(is_deleted=0).prefetch_related('itemimage_set').annotate(view_count=Count('itemview')).order_by('-view_count')[:46:1]
    paginator = Paginator(items, 12)

    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    
    return render(request, 'top-items.html', {'items': page_obj})

def FAQView(request):    

    faqs = FAQ.objects.all()
    return render(request, 'FAQ.html', context={'faqs':faqs})

def supportView(request):
    return render(request, 'support.html')

def supportMessageView(request):
    if request.method == "POST":
        name = request.POST.get('name')
        email = request.POST.get('email')
        message = request.POST.get('message')

        SupportTicket.objects.create(
            name=name,
            email=email,
            message=message,
        )

        email_template = 'email/support-message.html'
        context = {'name': name}
        email_text = render_to_string(email_template, context)

        subject = 'Support Message From Customer'
        from_email = 'support@multiverzum.com'
        to_email = email


        html_content = email_text

        msg = EmailMultiAlternatives(subject, html_content, from_email, [to_email])
        msg.attach_alternative(html_content, "text/html")
        msg.send()    

    return render(request, 'support-message.html')


def chatUserSearch(request):

    username = request.GET.get('username')
    users = User.objects.filter(username__icontains=username)[:6]
    user_data = [{'username': user.username, 'first_name': user.first_name, 
                'last_name':user.last_name, 'id': user.id,
                'profile_image': user.profile_image.url} for user in users]

    return JsonResponse({'users': user_data})

@login_required
def checkout(request):
    purchase_items = CartItem.objects.filter(user=request.user, is_deleted=0).select_related('item').prefetch_related('item__itemimage_set')
    return render(request, 'checkout.html', context={'purchase_items':purchase_items})


def googleVerificationFile(request):
    return render(request, 'google8270d479d6279e32.html')

def sitemap(request):
    return render(request, 'sitemap.xml')


def getTopViewedItems(request):
    items = Item.objects.filter(is_deleted=0).prefetch_related('itemimage_set').annotate(view_count=Count('itemview')).order_by('-view_count')[:8]
    serialized_items = serializers.serialize('json', items, fields=('pk', 'title', 'price'))
    items_data = json.loads(serialized_items)
    
    for item_data in items_data:
        item_pk = item_data['pk']
        item_images = ItemImage.objects.filter(item_id=item_pk)
        item_images_data = [{'image_url': image.image.url} for image in item_images]
        item_data['fields']['item_images'] = item_images_data
    
    return JsonResponse(items_data, safe=False)


def sendPurchaseRequestEmailNotification(request, seller):
    name = request.user.first_name
    email = seller.email

    email_template = 'email/purchase-request-notification.html'
    context = {'name': name}
    email_text = render_to_string(email_template, context)

    subject = 'You have a new purchase request from user ' + name 
    from_email = 'team@multiverzum.com'
    to_email = email


    html_content = email_text

    msg = EmailMultiAlternatives(subject, html_content, from_email, [to_email])
    msg.attach_alternative(html_content, "text/html")
    msg.send()


def saveItemComment(request):

    item_id = request.POST.get('item_id')
    try:
        item = Item.objects.get(id=item_id)
        comment = request.POST.get('comment')
        ItemComment.objects.create(
                user=request.user,
                item=item,
                comment=comment
            )
        return HttpResponse("Success")
    except:
        return HttpResponse("Item doesn't exist")

def getItemComments(request, item_id):
    comments = ItemComment.objects.filter(item=Item.objects.get(id=item_id), is_deleted=0).values('comment', 'id', 'date_created', 'user__username', 'user__profile_image')
    comments_list = list(comments)
    return JsonResponse(comments_list, safe=False)

def removeItemComment(request):
    commentId = request.POST.get('comment_id')
    comment = ItemComment.objects.get(id=commentId)
    if comment.user == request.user:
        comment.is_deleted = 1
        comment.save()
        return HttpResponse("Success")
    else:
        return HttpResponse("Error")



def sendMessageToMultibot(request):
    message = request.POST.get('message')
    print(message)
    response = askMultibot(message)

    return HttpResponse(response)

def lovelink(request):
    return HttpResponse("Success")