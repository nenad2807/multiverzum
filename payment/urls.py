# from .views import 
from django.conf.urls.static import static
from django.conf import settings
from django.urls import path

urlpatterns = [

    # path("dashboard", dashboardView),

]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)