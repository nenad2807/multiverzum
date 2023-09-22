from .views import dashboardView, ordersView, productsView, customersView, deletedItemsView, adminSupport, highestPerforming
from .views import userReports, removeUserProfile
from django.conf.urls.static import static
from django.conf import settings
from django.urls import path

urlpatterns = [

    path("dashboard", dashboardView),
    path("orders", ordersView),
    path("products", productsView),
    path("customers", customersView),
    path("support", adminSupport),
    path("highest-performing", highestPerforming),
    path("reports", userReports),
    path("deleted", deletedItemsView),
    path("remove-user", removeUserProfile),

]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)