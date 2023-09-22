from .models import Category
from .models import OrderItem
from user.models import CartItem
from chat.models import Message
from .models import SearchRecommendation
from django.db.models import Count, Q

def categories(request):
    grouped_categories = loadAllCategories()
    return {'grouped_categories': grouped_categories}


def cart_items(request):
    if request.user.is_authenticated:
        cart_items_count = CartItem.objects.filter(user=request.user).filter(is_deleted=0).count()
    else:
        cart_items_count = 0
    return {'cart_items_count': cart_items_count}


def order_requests(request):
    
    if request.user.is_authenticated:
        order_requests_count = OrderItem.objects.filter(item__seller=request.user).filter(status='Pending').count()
    else:
        order_requests_count = 0
    return {'order_requests_count': order_requests_count}

def unread_chats(request):

    if request.user.is_authenticated:

        unread_chats = (
            Message.objects.filter(receiver=request.user, status='sent')
            .values('sender')
            .annotate(unread_count=Count('id', filter=Q(status='sent')))
            .filter(unread_count__gt=0)
            .count()
        )
    else:
        unread_chats = 0

    return {'unread_chats': unread_chats}


def loadAllCategories():
    categories = Category.objects.all()
    grouped_categories = {}
    for category in categories:
        if not category.parent:
            grouped_categories[category] = []
        else:
            grouped_categories[category.parent].append(category)

    return grouped_categories
