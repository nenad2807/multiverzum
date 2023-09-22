from .views import chatView, sendMessage, directMessage, getMessages
from django.conf.urls.static import static
from django.conf import settings
from django.urls import path

urlpatterns = [

    path("", chatView),
    path("direct/<receiver_id>", directMessage),
    path("direct/get-messages/<receiver_id>", getMessages, name='getMessages'),
    path("send-message", sendMessage, name='sendMessage'),


]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)