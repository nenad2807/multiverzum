from .views import registerView, login_view, logout_view, profile_settings_view, toggleProfileLike, confirmAccountRemoval, reportUser
from .views import removeCartItem, toggleWishlistItem, myItems, deleteItem, updateCartItemQuantity, saveCategoryPreferenceInfo
from .views import wishlist, getCart, addCartItem, updateProfileImage, updateUserDescription, addEmailToMailingList
from django.conf.urls.static import static
from django.conf import settings
from django.urls import path

urlpatterns = [

    path("register", registerView, name='register'),
    path("login", login_view, name='login'),
    path("logout", logout_view, name='logout'),
    path("profile-settings", profile_settings_view, name='profile'),
    path("wishlist", wishlist, name='wishlist'),

    path("cart", getCart, name='cart'),
    path("add-cart-item", addCartItem, name='addCartItem'),
    path("remove-cart-item", removeCartItem, name='removeCartItem'),
    path("update-cart-item-quantity", updateCartItemQuantity, name='updateCartItemQuantity'),
    path("save-category-preference-info", saveCategoryPreferenceInfo),

    path("toggle-wishlist-item", toggleWishlistItem, name='toggleWishlistItem'),
    path("toggle-user-profile-like", toggleProfileLike, name='toggleProfileLike'),
    path("update-profile-image", updateProfileImage),

    path("update-description", updateUserDescription),
    path("report-user", reportUser),

    path("my-items", myItems),
    path("delete-item", deleteItem),

    path("mailing-list/add-email", addEmailToMailingList),
    path("delete-your-account", confirmAccountRemoval),


]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)