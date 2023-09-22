from .views import myOrders, orderInfo, orderSuccess
from django.conf.urls.static import static
from django.conf import settings
from django.urls import path

urlpatterns = [

    path("my-orders", myOrders),
    path("order_id=<order_id>", orderInfo),
    path("order-success", orderSuccess),


]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)