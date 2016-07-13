# -*- coding: utf-8 -*-
#bookstore/views.py
#Rolph Recto

from django.contrib.auth.models import User
from django.views.generic.base import TemplateView
from django.views.generic.list import ListView
from django.views.generic.edit import FormView
from django.db.models import Avg
from django.shortcuts import get_object_or_404
from django.core.urlresolvers import reverse, reverse_lazy
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from bookstore.templatetags import poll_extras
from django.http import HttpResponse
from bookstore.models import Author, Book, Review, Legal, Contact, About
from bookstore.forms import LoginForm, ContactForm
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.shortcuts import render, render_to_response
from django.http import HttpResponseRedirect
from django.utils import timezone
import datetime
from django.core.urlresolvers import reverse
import json
from captcha.helpers import captcha_image_url
from django.views.generic.edit import CreateView


def my_404_view(request):
    response = render_to_response('success.html', {},
                                  context_instance=RequestContext(request))
    response.status_code = 404
    return response

def my_500_view(request):
    response = render_to_response('success.html', {},
                                  context_instance=RequestContext(request))
    response.status_code = 500
    return response

def feed(request):
    posts = Book.objects.all()
    updated = Author.objects.all()
    return render(request, 'feed.xml', {'posts': posts, 'updated': updated})


class BookReviewListView(ListView):
    """View for a list of reviews for a book"""
    model = Review
    template_name = 'bookstore/book_review_list.html'

    def get_queryset(self):
        self.book = get_object_or_404(Book, pk=self.kwargs['book_id'])
        return Review.objects.filter(book=self.book)

    def get_context_data(self, **kwargs):
        # Call the base implementation first to get a context
        context = super(BookReviewListView, self).get_context_data(**kwargs)
        # Add in the book
        context['book'] = self.book
        agg_list = self.get_queryset().aggregate(Avg('rating'))
        context['average_rating'] = agg_list['rating__avg']
        return context


class UserReviewListView(ListView):
    """View for a list of reviews for a user"""
    model = Review
    template_name = 'bookstore/user_review_list.html'

    def get_queryset(self):
        #URLconf captured user id
        if 'user_id' in self.kwargs:
            self.user = get_object_or_404(User, pk=self.kwargs['user_id'])
        #URLconf captured username
        else:
            self.user = get_object_or_404(User, username=self.kwargs['username'])

        return Review.objects.filter(user=self.user)

    def get_context_data(self, **kwargs):
        # Call the base implementation first to get a context
        context = super(UserReviewListView, self).get_context_data(**kwargs)
        
        # Add in the user
        context['queried_user'] = self.user

        agg_list = self.get_queryset().aggregate(Avg('rating'))
        context['average_rating'] = agg_list['rating__avg']

        return context

class UserListView(ListView):
    """View for a list of books"""
    model = User
    template_name = 'bookstore/user.html'
    paginate_by = 5  #and that's it !!
    def get_queryset(self):
        user_list=User.objects.all()
        return user_list



class AuthorListView(ListView):
    """View for a list of books"""
    model = Author
    template_name = 'bookstore/author_list.html'
    paginate_by = 8  #and that's it !!

    def get_queryset(self):
        if self.kwargs:
            author_list=(Author.objects.filter(last_name=self.kwargs['username'])
                .order_by('first_name'))
            return author_list
        else:      
            author_list=(Author.objects.all()
                .order_by('first_name'))
            return author_list

class LegalListView(ListView):
    """View for a list of books"""
    model = Legal
    template_name = 'bookstore/Legal.html'

    def get_queryset(self):
         if self.kwargs:
            legal_list=1
            return legal_list
         else:      
            legal_list=(Legal.objects.all())
            return legal_list


class BookListView(ListView):
    """View for a list of books"""
    model = Book
    template_name = 'bookstore/book_list.html'
    paginate_by = 4  #and that's it !!

    def get_queryset(self):


        book_list=(Book.objects.all()
            .annotate(Avg('review__rating'))
            .order_by('title'))
        
        return book_list


class LoginView(FormView):
    """View for the login page"""
    template_name = 'bookstore/login.html'
    form_class = LoginForm
    success_url = reverse_lazy('bookstore:login_success')

    def form_valid(self, form):
        #try to log the user in
        user = authenticate(
            username=form.cleaned_data['username'],
            password=form.cleaned_data['password']
        )
        #no need to check user because we already authenticated it in the form
        login(self.request, user)

        return super(LoginView, self).form_valid(form)

class LogoutView(TemplateView):
    """View for the logout page"""
    template_name = 'bookstore/logout.html'

    def get_context_data(self, **kwargs):
        context = super(LogoutView, self).get_context_data(**kwargs)

        #log user out
        print self.request.user
        if self.request.user.is_authenticated():
            logout(self.request)
            context['logout_success'] = True
        #user wasn't logged in
        else:
            context['logout_success'] = False

        return context

class AboutListView(ListView):
    """View for a list of reviews for a book"""
    model = About
    template_name = 'bookstore/about.html'

    def get_queryset(self):
        about_list=About.objects.all()
        return about_list


def contact(request):
    
    form_class = ContactForm

    if request.method == 'GET':
        form = ContactForm()
        #return HttpResponse("Do something")
    else:
        form = ContactForm(request.POST)
        if form.is_valid():
            contact_name = form.cleaned_data['c_name']
            contact_email = form.cleaned_data['c_email']
            message_title = form.cleaned_data['m_title']
            message_context = form.cleaned_data['m_content']     
            b=Contact(contact_name=contact_name,contact_email=contact_email,
            message_title=message_title,message_context=message_context,
            timestamp=datetime.datetime.now())
            b.save()
            return HttpResponseRedirect("/success")
    return render(request,'bookstore/Contact.html', {'form': form})
