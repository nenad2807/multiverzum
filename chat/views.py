from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from .models import Message
from main.models import User
from django.http import HttpResponse, JsonResponse
from django.db.models import Q
from collections import defaultdict
from operator import itemgetter
from django.template.loader import render_to_string
from django.core.mail import send_mail, EmailMultiAlternatives


@login_required
def chatView(request):
        
    messages = Message.objects.filter(sender=request.user) | Message.objects.filter(receiver=request.user)
    contacts = getUserContacts(messages, request)

    unread_chats = Message.objects.filter(receiver=request.user, status='sent') \
        .values_list('sender__id', flat=True) \
        .filter(~Q(sender=request.user)) \
        .distinct()

    return render(request, 'inbox.html', context={'contacts':contacts, 'unread_chats':unread_chats})

@login_required
def directMessage(request, receiver_id):

    messages = Message.objects.filter(sender=request.user) | Message.objects.filter(receiver=request.user)
    contacts = getUserContacts(messages, request)
    receiver = User.objects.get(id=receiver_id)

    received_messages = Message.objects.filter(receiver=request.user, sender=receiver)
    received_messages.update(status='read')

    unread_chats = Message.objects.filter(receiver=request.user, status='sent') \
        .values_list('sender__id', flat=True) \
        .filter(~Q(sender=request.user)) \
        .distinct()

    return render(request, 'chat.html', context={'messages': messages, 'receiver':receiver, 'contacts':contacts, 'unread_chats':unread_chats})


@login_required
def getMessages(request, receiver_id):

    messages = Message.objects.filter(Q(sender=request.user, receiver=receiver_id) | Q(sender=receiver_id, receiver=request.user)).order_by('-created_at').filter(is_deleted=0)[:10][::-1]
    receiver = User.objects.get(id=receiver_id)

    messages_list = []
    for message in messages:
        message_dict = {
            'id': message.id,
            'sender': message.sender.id,
            'receiver': message.receiver.id,
            'message': message.message,
            'created_at': message.created_at.strftime('%H:%M')
        }
        messages_list.append(message_dict)

    response_dict = {
        'messages': messages_list,
        'receiver': {
            'id': receiver.id,
            'username': receiver.username
        }
    }

    return JsonResponse(response_dict)



@login_required
def sendMessage(request):
    message = request.POST.get('message', '')
    sender = request.user
    receiver_id = request.POST.get('receiver', '')
    receiver = User.objects.get(id=receiver_id)

    new_message = Message(
        message=message,
        sender=sender,
        receiver=receiver
    )

    new_message.save()

    sendNewMessageEmailNotificationToReceiver(request.user.username, receiver.email)

    return HttpResponse('Message sent successfully')


def getUserContacts(messages, request):
    contacts = defaultdict(dict)
    for message in messages:
        if message.sender != request.user:
            user = message.sender
        else:
            user = message.receiver

        contacts[user]['user'] = user
        contacts[user]['last_message'] = message.message
        contacts[user]['last_message_time'] = message.calculate_last_message_time()

    sorted_contacts = sorted(contacts.values(), key=itemgetter('last_message_time'), reverse=True)
    return list(reversed(sorted_contacts))


def sendNewMessageEmailNotificationToReceiver(sender_username, receiver_email):
    
    email_template = 'email/new-message-notification.html'
    context = {'name': sender_username}
    email_text = render_to_string(email_template, context)

    try:

        subject = 'You have a new message from '+sender_username
        from_email = 'team@multiverzum.com'
        to_email = receiver_email


        html_content = email_text

        msg = EmailMultiAlternatives(subject, html_content, from_email, [to_email])
        msg.attach_alternative(html_content, "text/html")
        msg.send()


        return redirect('/')
    except Exception as e:
        print(e)
        return redirect('/')