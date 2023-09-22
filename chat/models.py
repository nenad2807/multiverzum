from django.db import models
from django.utils import timezone
from main.models import User, Item


class BaseModel(models.Model):
    created_at = models.DateTimeField(auto_now=True)
    updated_at = models.DateTimeField(auto_now=True)
    is_deleted = models.BooleanField(default=False)

    class Meta:
        abstract = True

class Message(BaseModel):
    sender = models.ForeignKey(User, on_delete=models.CASCADE, related_name='message_sender')
    receiver = models.ForeignKey(User, on_delete=models.CASCADE, related_name='message_receiver', default=1)
    status = models.CharField(max_length=50, default="Sent")
    message = models.CharField(max_length=9999, null=True)

    REQUIRED_FIELDS = []

    class Meta:
        db_table = "message"

    def calculate_last_message_time(self):
        now = timezone.now()
        last_message_time = self.__class__.objects.filter(sender=self.sender, receiver=self.receiver).latest('id').created_at
        time_difference = now - last_message_time
        minutes = time_difference.total_seconds() // 60
        if minutes//60 > 24:
            return str(int(minutes//60//24)) + " days"
        elif minutes > 60:
            return str(int(minutes//60)) + " hours"
        else:
            return str(int(minutes)) + " mins"