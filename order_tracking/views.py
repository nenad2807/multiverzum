from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
from main.models import OrderItem

def myOrders(request):

    orders = OrderItem.objects.select_related('item').filter(order__customer=request.user).filter(status='Pending').prefetch_related('item__itemimage_set')

    return render(request, 'my-orders.html', context={'orders':orders})

def orderInfo(request, order_id):

    orderInfo = OrderItem.objects.select_related('item').filter(order__customer=request.user).prefetch_related('item__itemimage_set').filter(id=order_id).first()

    return render(request, 'orderInfo.html', context={'orderInfo':orderInfo})


def orderSuccess(request):
    return render(request, 'order-success-view.html')
