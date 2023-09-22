from django.db.models.signals import post_save
from django.dispatch import receiver
from .models import Item, User, UserInfo



@receiver(post_save, sender=User)
def create_my_model(sender, instance, created, **kwargs):
    if created:
        UserInfo.objects.create(user=instance)
