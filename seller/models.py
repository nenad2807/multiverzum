from django.db import models
from django.db import models
from django.utils import timezone
from main.models import Filter, Item



class BaseModel(models.Model):
    date_created = models.DateTimeField(auto_now=True)
    is_deleted = models.BooleanField(default=False)

    class Meta:
        abstract = True


class ItemFilter(BaseModel):
    filter = models.ForeignKey(Filter, default=None, on_delete=models.CASCADE)
    item = models.ForeignKey(Item, default=None, on_delete=models.CASCADE)
    class Meta:
        db_table = "item_filter"
