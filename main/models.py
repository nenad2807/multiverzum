from django.db import models
from django.utils import timezone
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
from django.contrib.auth.models import PermissionsMixin
import uuid
import os


class BaseModel(models.Model):
    date_created = models.DateTimeField(auto_now=True)
    updated_at = models.DateTimeField(auto_now=True)
    is_deleted = models.BooleanField(default=False)

    class Meta:
        abstract = True

class MyUserManager(BaseUserManager):
    def create_user(self, email, username, password=None):
        if not email:
            raise ValueError("Users must have an email address.")
        if not username:
            raise ValueError("Users must have a username.")
        user = self.model(

            email=self.normalize_email(email),
            username = username,
        )
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, username, password):
        user = self.create_user(
            email = self.normalize_email(email),
            username = username,
            password = password,
        )
        user.is_staff = True
        user.is_superuser = True
        return user

def get_profile_image_filepath(self, filename):
    return f'/media/user/profile_images/{self.pk}/{profile_image.png}'

def get_default_profile_image():
    return "/user/profile_images/profile.svg"

class User(AbstractBaseUser):
    email = models.EmailField(max_length=60, unique=True)
    username = models.CharField(max_length=50, unique=True)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    description = models.CharField(max_length=999, default='Enter more about yourself...')
    last_login = models.DateTimeField(auto_now=True)
    is_active = models.BooleanField(default=True)
    is_superuser = models.BooleanField(default=False)
    is_staff = models.BooleanField(default=False)
    is_admin = models.BooleanField(default=False)
    is_seller = models.BooleanField(default=False)
    first_visit = models.BooleanField(default=True)
    date_joined = models.DateTimeField(auto_now=True)
    is_deleted = models.BooleanField(default=False)
    profile_image = models.ImageField(max_length=255, upload_to=get_profile_image_filepath, null=True, blank=True, default=get_default_profile_image)

    objects = MyUserManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username']


    def __str__(self):
        return self.username

    def get_profile_image_path(self):
        return str(self.profile_image)[str(self.profile_image).index(f'profile_images/{self.pk}/'):]
    def has_perm(self, perm, obj=None):
        return self.is_admin
    def has_module_perms(self, app_label):
        return True  

    class Meta:
        db_table = "user"


class UserInfo(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='userinfo')
    country = models.CharField(max_length=250, null=True)
    city = models.CharField(max_length=100, null=True)
    address = models.CharField(max_length=250, null=True)
    address_2 = models.CharField(max_length=250, null=True)
    phone_number = models.CharField(max_length=12, null=True)
    state_or_region = models.CharField(max_length=250, null=True)
    views = models.IntegerField(default=0)
    shop_location = models.CharField(max_length=999, null=True)

    REQUIRED_FIELDS = []

    class Meta:
        db_table = "user_info"


class Category(BaseModel):
    name = models.CharField(max_length=255)
    parent = models.ForeignKey('self', null=True, blank=True, on_delete=models.CASCADE)

    def __str__(self):
        return self.name

    class Meta:
        db_table = "category"
        verbose_name_plural = "categories"


class Item(BaseModel):
    title = models.CharField(max_length=120)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    category = models.ForeignKey(Category, default=None, on_delete=models.CASCADE)
    tags = models.CharField(max_length=100, null=True)
    description = models.CharField(max_length=2900, null=True)
    condition = models.CharField(max_length=100, null=True, default='New')
    seller = models.ForeignKey(User, default=None, on_delete=models.CASCADE)
    likes = models.IntegerField(default=0)
    discount_price = models.DecimalField(max_digits=10, decimal_places=2, default=0, null=True)
    shipping_cost = models.DecimalField(max_digits=10, decimal_places=2, default=4)
    is_available = models.BooleanField(default=True)
    multiple_quantities = models.BooleanField(default=False)

    REQUIRED_FIELDS = [title, price]


    def __str__(self):
        return self.image
    
    class Meta:
        db_table = "item"



def generate_filename(instance, filename):
    extension = filename.split('.')[-1]
    new_filename = f'{uuid.uuid4()}.{extension}'
    path = 'main/item_images/'
    return os.path.join(path, new_filename)


class ItemImage(BaseModel):

    item = models.ForeignKey(Item, on_delete=models.CASCADE)
    image = models.ImageField(upload_to=generate_filename)

    def __str__(self):
        return self.location
    
    class Meta:
        db_table = "item_image"
        

class Order(BaseModel):
    customer = models.ForeignKey(User, default=None, on_delete=models.CASCADE)

    class Meta:
        db_table = "order"


class OrderItem(models.Model):
    order = models.ForeignKey(Order, default=None, on_delete=models.CASCADE)
    price = models.DecimalField(max_digits=10,decimal_places=2)
    quantity = models.PositiveIntegerField(default=1)
    item = models.ForeignKey(Item, default=None, on_delete=models.CASCADE)
    seller = models.ForeignKey(User, default=None, on_delete=models.CASCADE)
    status = models.CharField(max_length=50, default="Pending")

    class Meta:
        db_table = "order_item"


class Filter(BaseModel):

    title = models.CharField(max_length=80, default="None")
    html_template_name = models.CharField(max_length=80, default="None")


    def __str__(self):
        return self.title
    
    class Meta:
        db_table = "filter"



class SearchRecommendation(BaseModel):
    query = models.CharField(max_length=120, null=True)


    REQUIRED_FIELDS = []

    class Meta:
        db_table = "search_recommendation"

    def __str__(self):
        return self.query




class FAQ(BaseModel):

    question = models.CharField(max_length=200)
    answer = models.CharField(max_length=999)

    def __str__(self):
        return self.question
    
    class Meta:
        db_table = "faq"


class SupportTicket(BaseModel):

    name = models.CharField(max_length=50, null=True)
    email = models.CharField(max_length=50, null=True)
    message = models.CharField(max_length=200)

    def __str__(self):
        return self.user
    
    class Meta:
        db_table = "support_ticket"


class ItemComment(BaseModel):
    
    user = models.ForeignKey(User, default=None, on_delete=models.CASCADE)
    item = models.ForeignKey(Item, default=None, on_delete=models.CASCADE)
    comment = models.CharField(max_length=200)


    def __str__(self):
        return self.comment
    
    class Meta:
        db_table = "item_comment"