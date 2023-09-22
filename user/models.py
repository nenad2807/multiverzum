from django.db import models
from django.utils import timezone
from main.models import User, Item, Filter, OrderItem, Category


class BaseModel(models.Model):
    date_created = models.DateTimeField(auto_now=True)
    updated_at = models.DateTimeField(auto_now=True)
    is_deleted = models.BooleanField(default=False)

    class Meta:
        abstract = True


class Wishes(BaseModel):
    user = models.ForeignKey(User, default=None, on_delete=models.CASCADE)
    item = models.ForeignKey(Item, default=None, on_delete=models.CASCADE)

    REQUIRED_FIELDS = []


class CartItem(BaseModel):
    user = models.ForeignKey(User, default=None, on_delete=models.CASCADE)
    item = models.ForeignKey(Item, default=None, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField(default=1)

    class Meta:
        db_table = "cart_item"
        verbose_name_plural = "cart_items"

class ProfileLike(BaseModel):
    liked_by = models.ForeignKey(User, default=None, on_delete=models.CASCADE, related_name='liked_by')
    user = models.ForeignKey(User, default=None, on_delete=models.CASCADE, related_name='like_receiver')

    REQUIRED_FIELDS = []

    class Meta:
        db_table = "profile_like"

class MailingList(BaseModel):
    email = models.EmailField(max_length=60, unique=True)

    REQUIRED_FIELDS = []

    class Meta:
        db_table = "mailing_list"


class userCategoryPreferences(BaseModel):
    user = models.ForeignKey(User, default=None, on_delete=models.CASCADE)
    category = models.ForeignKey(Category, default=None, on_delete=models.CASCADE)

    REQUIRED_FIELDS = []

    class Meta:
        db_table = "user_category_preference"


class ItemView(BaseModel):
    user = models.ForeignKey(User, default=None, on_delete=models.CASCADE)
    item = models.ForeignKey(Item, default=None, on_delete=models.CASCADE)

    REQUIRED_FIELDS = []

    class Meta:
        db_table = "item_view"

class UserReport(BaseModel):
    user_reporting = models.ForeignKey(User, default=None, on_delete=models.CASCADE, related_name='reports_submitted')
    user_reported = models.ForeignKey(User, default=None, on_delete=models.CASCADE, related_name='reports_received')
    report_message = models.CharField(max_length=999, default=None)

    class Meta:
        db_table = "user_report"