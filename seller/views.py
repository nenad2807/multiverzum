from django.shortcuts import render, redirect
from main.models import User, UserInfo, Item, ItemImage, Category, OrderItem, Filter
from user.models import ProfileLike
import uuid
from django.http import HttpResponse
from django.contrib.auth.decorators import login_required
from seller.models import ItemFilter
import json

@login_required
def publishStepOne(request):

    if request.method == 'POST':
          
        title = request.POST.get('title')
        price = request.POST.get('price')
        category = request.POST.get('category')
        tags = request.POST.get('tags')

        request.session['title'] = title
        request.session['price'] = price
        request.session['category'] = category
        request.session['tags'] = tags

   
        return redirect('/seller/publish/step=2')



    grouped_categories = loadAllCategories()
    return render(request, 'publish-steps/step-1-view.html', {'grouped_categories': grouped_categories})

@login_required
def publishStepTwo(request):
    if request.method == 'POST':
        
        condition = request.POST.get('condition')
        multiple_quantities = request.POST.get('multiple_quantities')

        if multiple_quantities == 'true':
            is_multiple_quantities = True
        else:
            is_multiple_quantities = False

        request.session['condition'] = condition
        request.session['multiple_quantities'] = is_multiple_quantities

        return redirect('/seller/publish/step=3')

    return render(request, 'publish-steps/step-2-view.html')


@login_required
def publishStepThree(request):
    if request.method == 'POST':
        
        description = request.POST.get('description')
        request.session['description'] = description

        return redirect('/seller/publish/step=4')
        
    return render(request, 'publish-steps/step-3-view.html')


@login_required
def publishStepFour(request):
    if request.method == 'POST':

        filter_list = request.session.get('filter_list', [])
        new_filter = request.POST.get('filter_id')
        if new_filter not in filter_list:
            filter_list.append(new_filter)
        else:
            filter_list.remove(new_filter)

        request.session['filter_list'] = filter_list

        return redirect('/seller/publish/step=4')

    filters = Filter.objects.all()

    try:
        session_filters = request.session.get('filter_list', [])
        selected_filters = Filter.objects.filter(id__in=session_filters)
    except:
        selected_filters = None

    return render(request, 'publish-steps/step-4-view.html', context={'filters':filters, 'selected_filters':selected_filters})


@login_required
def publishStepFive(request):
    if request.method == 'POST':

        title = request.session.get('title', None)
        price = request.session.get('price', None)
        category = request.session.get('category', None)
        category = Category.objects.get(id=category)
        tags = request.session.get('tags', None)
        description = request.session.get('description', None)
        condition = request.session.get('condition', None)
        multiple_quantities = request.session.get('multiple_quantities', None)
        filter_list = request.session.get('filter_list', None)


        item = Item.objects.create(title=title, price=price, description=description, seller=request.user, category=category, tags=tags, condition=condition, multiple_quantities=multiple_quantities)

        images = request.FILES.getlist('images')
        for image in images:
            ItemImage.objects.create(item=item, image=image)

        try:
            for filter_id in filter_list:
                item_filter = ItemFilter.objects.create(
                    filter=Filter.objects.get(id=filter_id),
                    item=item
                )
                item_filter.save()
        except:
            pass

        removeSessionData(request)
        return redirect('/seller/publish')

    
    return render(request, 'publish-steps/step-5-view.html')


def sellerProfile(request, username):

    seller = User.objects.filter(username=username).first()
    seller_info = UserInfo.objects.filter(user=seller).first()

    items = Item.objects.filter(seller=seller).filter(is_deleted=0).prefetch_related('itemimage_set').order_by('-id')
    deliveries = Item.objects.filter(seller=seller, orderitem__isnull=False, orderitem__status='Delivered').count()
    orders = Item.objects.filter(seller=seller, orderitem__isnull=False).count()

    no_of_items = items.filter(seller=seller).count()

    if request.user.is_authenticated:
        is_liked = ProfileLike.objects.filter(user=seller, liked_by=request.user, is_deleted=0).exists()
    else:
        is_liked = False
    profile_likes_no = ProfileLike.objects.filter(user=seller, is_deleted=0).count()

    return render(request, 'sellerProfile.html', {'items': items, 'seller': seller, 'seller_info':seller_info, 'no_of_items': no_of_items, 'deliveries': deliveries, 'is_liked':is_liked, 'profile_likes_no':profile_likes_no, 'orders':orders})


def myOrderRequests(request):
    
    if request.method == 'POST':

        item_id = request.POST.get('item_id', '')
        item = OrderItem.objects.filter(item=item_id).first()

        if 'allow' in request.POST:
            item.status = 'Accepted'
            item.save()
        elif 'deny' in request.POST:
            item.status = 'Denied'
            item.save()
    orders = OrderItem.objects.select_related('item').filter(item__seller=request.user).filter(status='Pending').prefetch_related('item__itemimage_set')

    return render(request, 'my-order-requests.html', {'orders': orders})




def loadAllCategories():
    categories = Category.objects.all()
    grouped_categories = {}
    for category in categories:
        if not category.parent:
            grouped_categories[category] = []
        else:
            grouped_categories[category.parent].append(category)

    return grouped_categories



def removeSessionData(request):
    title = request.session.pop('title')
    price = request.session.pop('price')
    category = request.session.pop('category')
    tags = request.session.pop('tags')
    description = request.session.pop('description')
    condition = request.session.pop('condition')
    multiple_quantities = request.session.pop('multiple_quantities')
    try:
        filters = request.session.pop('filter_list')
    except:
        pass


def editItemView(request, item_id):

    item = Item.objects.filter(id=item_id, is_deleted=0).first()
    filters = Filter.objects.all()

    if request.method == "POST":
        
        title = request.POST.get('title')
        price = request.POST.get('price')
        description = request.POST.get('description')

        item.title = title
        item.price = price
        item.description = description
        item.save()
    
    itemImages = ItemImage.objects.filter(item_id=item_id).filter(is_deleted=0)
    item_filters = ItemFilter.objects.filter(item=item, is_deleted=0)

    if request.user == item.seller:
        return render(request, 'edit-item.html', {'item': item, 'itemImages':itemImages, 'item_filters':item_filters, 'filters':filters})
    else:
        return render(request, 'exceptions/access-denied-view.html')

def removeFilterFromItem(request):

    if request.method == "POST":
        filter_id = request.POST.get('filter_id')

        item_filter = ItemFilter.objects.get(id=filter_id)
        item_filter.is_deleted = 1
        item_filter.save()

        return HttpResponse("Filter removed from item!")

def addFilterToItem(request):        

    filter_id = request.POST.get('filter_id')
    item_id = request.POST.get('item_id')

    item_filter = ItemFilter.objects.create(
                    filter=Filter.objects.get(id=filter_id),
                    item=Item.objects.get(id=item_id)
                )
    item_filter.save()

    return HttpResponse("Filter added to item!")
