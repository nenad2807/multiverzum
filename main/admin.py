from django.contrib import admin
from django.contrib.auth.admin import UserAdmin

from main.models import User, Order, OrderItem, Item, Category, Filter, SearchRecommendation, FAQ
from user.models import CartItem


class AccountAdmin(UserAdmin):
    list_display = ('email', 'username', 'date_joined', 'last_login', 'is_admin', 'is_staff')
    search_fields = ('email', 'username')
    readonly_fields = ('id', 'date_joined', 'last_login')

    filter_horizontal = ()
    list_filter = ()
    fieldsets = ()

admin.site.register(User, AccountAdmin)
admin.site.register(Order)
admin.site.register(OrderItem)
admin.site.register(Item)
admin.site.register(Category)
admin.site.register(CartItem)
admin.site.register(Filter)
admin.site.register(FAQ)
admin.site.register(SearchRecommendation)
