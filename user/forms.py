from main.models import User
from django import forms
from django.contrib.auth.forms import UserCreationForm, authenticate


class RegistrationForm(UserCreationForm):

    email = forms.EmailField(max_length=255, help_text="Required. Add a valid email address.")
    first_name = forms.CharField(max_length=30, required=False)
    last_name = forms.CharField(max_length=30, required=False)
    is_seller = forms.BooleanField(required=False)

    class Meta:
        model = User
        fields = ('email', 'username', 'password1', 'password2', 'first_name', 'last_name', 'is_seller')


        def clean_email(self):
            email = self.cleaned_data['email'].lower()
            try: 
                account = User.objects.get(email=email)
            except Exception as e:
                return email
            raise forms.ValidationError(f"Email {email} is already in use.")


        def clean_username(self):
            email = self.cleaned_data['email'].lower()
            try:
                account = User.objects.get(username=username)
            except Exception as e:
                return username
            raise forms.ValidationError(f"Username {username} is already in use.")

        def save(self, commit=True):
            user = super().save(commit=False)
            user.first_name = self.cleaned_data['first_name']
            user.last_name = self.cleaned_data['last_name']
            if commit:
                user.save()
            return user

class UserAuthenticationForm(forms.ModelForm):

    password = forms.CharField(label="Password", widget=forms.PasswordInput)

    class Meta:
        model = User
        fields = ('email', 'password')
    
    def clean(self):
        if self.is_valid():
            email = self.cleaned_data['email']
            password = self.cleaned_data['password']
            if not authenticate(email=email, password=password):
                raise forms.ValidationError("Invalid Login")




