from django.shortcuts import render, redirect
from main.models import User, OrderItem, Item, Order, SupportTicket
from user.models import UserReport
from django.http import HttpResponse, JsonResponse
from django.db.models import Q, F, Sum
from datetime import datetime, timedelta
from django.db.models.functions import TruncMonth
from django.db.models import Avg
from django.db.models.functions import TruncMonth
from django.db.models import Count
from decimal import Decimal
from django.utils.dateformat import DateFormat

def dashboardView(request):

    if request.user.is_admin:
    
        total_earnings = OrderItem.objects.filter(status='Delivered').aggregate(total_price=Sum('price'))['total_price']
        registered_users = User.objects.filter(is_deleted=0).count()
        items_published =  Item.objects.filter(is_deleted=0).count()

        total_orders = OrderItem.objects.count()
        orders_completed = OrderItem.objects.filter(status='Delivered').count()
        orders_denied = OrderItem.objects.filter(status='Denied').count()
        orders_awaiting_response = OrderItem.objects.filter(status='Sent').count()
        average_earnings_per_month = OrderItem.objects.all().annotate(month=TruncMonth('order__date_created')).values('month').annotate(avg_price=Avg('price')).aggregate(Avg('avg_price'))
        if average_earnings_per_month['avg_price__avg']:
            average_earnings_per_month = round(average_earnings_per_month['avg_price__avg'])
        else:
            average_earnings_per_month = 0

        users_deleted = User.objects.filter(is_deleted=1).count()

        if not total_earnings:
            total_earnings = 0

        userGrowthData = getUsersGrowthData()
        #monthlyEarningsData = getMonthlyEarningsData()

        return render(request, 'dashboard.html', context={'total_orders':total_orders, 
            'orders_completed':orders_completed, 'orders_denied':orders_denied, 
            'orders_awaiting_response':orders_awaiting_response, 
            'registered_users':registered_users, 'total_earnings':total_earnings, 
            'items_published':items_published, 'userGrowthData':userGrowthData, 
            'average_earnings_per_month':average_earnings_per_month, 'users_deleted':users_deleted})
    else:
        return HttpResponse("403")

def ordersView(request):
    if request.user.is_admin:
        order_items = OrderItem.objects.select_related('item').prefetch_related('item__itemimage_set')
    else:
        return HttpResponse("403")

    return render(request, 'orders.html', context={'order_items':order_items})

def productsView(request):
    if request.user.is_admin:
        items = Item.objects.filter(is_deleted=0).prefetch_related('itemimage_set').annotate(view_count=Count('itemview')).order_by('-view_count')[:8:1]
        return render(request, 'products.html', context={'items':items})
    else:
        return HttpResponse("403")

def adminSupport(request):
    if request.user.is_admin:
        tickets = SupportTicket.objects.filter(is_deleted=0)
        return render(request, 'support-tickets.html', context={'tickets':tickets})
    else:
        return HttpResponse("403")

def customersView(request):
    if request.user.is_admin:
        users = User.objects.filter(is_deleted=0).order_by('-id')
        return render(request, 'customers.html', context={'users':users})
    else:
        return HttpResponse("403")

def highestPerforming(request):
    if request.user.is_admin:
        topItems = Item.objects.filter(is_deleted=0).prefetch_related('itemimage_set').annotate(view_count=Count('itemview')).order_by('-view_count')[:8:1]
        topUsers = User.objects.filter(is_deleted=0).order_by('-id')[:8:1]
        return render(request, 'highest-performing.html', context={'topUsers':topUsers, 'topItems':topItems})
    else:
        return HttpResponse("403")

def userReports(request):
    if request.user.is_admin:
        reports = UserReport.objects.filter(is_deleted=0)
        return render(request, 'user-reports.html', context={'reports':reports})
    else:
        return HttpResponse("403")

def deletedItemsView(request):
    if request.user.is_admin:
        items = Item.objects.filter(is_deleted=1).prefetch_related('itemimage_set').annotate(view_count=Count('itemview')).order_by('-view_count')[:8:1]
        return render(request, 'deleted-items.html', context={'items':items})
    else:
        return HttpResponse("403")


def getUsersGrowthData():
    today = datetime.now().date()
    start_date = today - timedelta(days=365)

    data = (
        User.objects
        .annotate(month=TruncMonth('date_joined'))
        .filter(date_joined__gte=start_date)
        .values('month')
        .annotate(count=Count('id'))
        .order_by('month')
    )

    labels = []
    values = []
    cumulative_count = 0

    for d in data:
        month_name = DateFormat(d['month']).format('F')  # Get the full name of the month
        labels.append(month_name)
        cumulative_count += d['count']
        values.append(cumulative_count)

    return {'labels': labels, 'values': values}



def getMonthlyEarningsData():
    
    data = OrderItem.objects \
        .annotate(month=TruncMonth('order__date_created')) \
        .values('month') \
        .annotate(total=Sum(F('quantity') * F('price'))) \
        .order_by('month')

    labels = [d['month'].strftime('%Y-%m-%d') for d in data]
    values = [float(d['total']) for d in data]

    print(values)

    return {'labels': labels, 'values': values}


def removeUserProfile(request):

    if request.user.is_admin:
        user_id = request.POST.get('user_id', '')
        user = User.objects.get(id=user_id)
        user.is_deleted = 1
        user.save()
        
        return redirect("/administration/customers")

    else:
        return HttpResponse("403")
