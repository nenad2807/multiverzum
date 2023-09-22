from .views import sellerProfile, myOrderRequests, publishStepOne, publishStepTwo, publishStepThree, addFilterToItem
from .views import publishStepFour, publishStepFive, editItemView, removeFilterFromItem
from django.conf.urls.static import static
from django.conf import settings
from django.urls import path

urlpatterns = [

    path("publish", publishStepOne),
    path("publish/step=2", publishStepTwo),
    path("publish/step=3", publishStepThree),
    path("publish/step=4", publishStepFour),
    path("publish/step=5", publishStepFive),

    path("profile/<username>", sellerProfile),
    path("order-requests", myOrderRequests),

    path("edit-item/<item_id>", editItemView),
    path("add-filter-to-item", addFilterToItem),
    path("remove-filter-from-item", removeFilterFromItem),


]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)