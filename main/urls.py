from .views import getHome, getItem, getSearchResults, aboutPage, purchaseItemNow, exploreCategory, explore, topViewedItems, saveItemComment, getItemComments
from .views import error_404, termsOfService, privacyPolicy, sendPurchaseRequest, featureInDev, accessDeniedView, getSearchSuggestions
from .views import FAQView, supportView, supportMessageView, checkout, googleVerificationFile, sitemap, chatUserSearch, getTopViewedItems
from .views import removeItemComment, sendMessageToMultibot, lovelink
from django.urls import path
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [

    path("", getHome, name='home'),
    path("explore", explore),
    path("explore/top", topViewedItems),
    path("explore/category/<categoryName>", exploreCategory, name='exploreCategory'),
    path("item/<int:item_id>", getItem),
    path("search_query=<str:search_query>", getSearchResults),
    path("about", aboutPage),
    path("exceptions/page-not-found", error_404),
    path("info/terms-of-service", termsOfService),
    path("info/privacy-policy", privacyPolicy),
    path("info/support", supportView),
    path("info/support/send-message", supportMessageView),
    path("info/FAQ", FAQView),

    path("item/confirm-purchase/item_id=<int:item_id>/quantity=<int:quantity>", purchaseItemNow),
    path("checkout", checkout),
    path("send-purchase-request", sendPurchaseRequest),

    path("get-item-comments/item-id=<item_id>", getItemComments),
    path("save-item-comment", saveItemComment),
    path("remove-item-comment", removeItemComment),

    path("exceptions/feature-still-in-development", featureInDev, name='featureInDev'),
    path("exceptions/access-denied", accessDeniedView, name='accessDeniedView'),


    path("google8270d479d6279e32.html", googleVerificationFile),
    path("sitemap", sitemap),

    path("api/chat-user-search", chatUserSearch),
    path('get-search-suggestions/', getSearchSuggestions),

    path('api/get-top-viewed-items', getTopViewedItems),

    path('api/ask-multibot', sendMessageToMultibot),
    path('api/lovelink', lovelink),

]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)