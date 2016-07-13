# -*- coding: utf-8 -*-
#bookstore/forms.py
#Rolph Recto

from django import forms
from django.contrib.auth import authenticate
from bookstore.models import Contact
from django.http import HttpResponseRedirect, HttpResponse
from django.template.defaultfilters import mark_safe
from ckeditor.fields import RichTextFormField
from captcha.fields import CaptchaField

class LoginForm(forms.Form):
    username = forms.CharField(max_length=100, label='Username')
    password = forms.CharField(max_length=100, widget=forms.PasswordInput())

    def clean(self):
        """authenticate the user info"""
        cleaned_data = super(LoginForm, self).clean()
        username = cleaned_data.get('username')
        password = cleaned_data.get('password')

        user = authenticate(username=username, password=password)

        if user is not None:
            #check if user is active
            if not user.is_active:
                raise forms.ValidationError('This account is disabled.')
        else:
            raise forms.ValidationError('Invalid user information.')

        return cleaned_data

class ContactForm(forms.Form):
    c_name = forms.CharField(
        required=True,
        label = mark_safe(u'<strong>username</strong>')
        )
    c_email = forms.EmailField(
        required=True,
        label = mark_safe(u'<strong>email</strong>')
        )
    m_title = forms.CharField(
        required=True,
        label = mark_safe(u'<strong>message title</strong>')
        )
    m_content = forms.CharField(
        required=True,
        widget=forms.Textarea,
        label = mark_safe(u'<strong>message content</strong>')
    )

    captcha = CaptchaField()
       
    
    
    


