#bookstore/urls.py
#Rolph Recto

from django.conf.urls import patterns, include, url
from django.views.generic.base import TemplateView

from bookstore.models import Book, Author, Review, Legal
from bookstore.views import *
from bookstore import views

from django.conf.urls.static import static
from django.conf import settings


urlpatterns = patterns('bookstore.views',
    #index/homepage
    url(r'^$',
        TemplateView.as_view(template_name='bookstore/index.html'),
        name='index'),

    url(r'^index/?$',
        TemplateView.as_view(template_name='bookstore/index.html'),
        name='index'),

    #login user
    url(r'^login/?$',
        LoginView.as_view(),
        name='login'),

    #login success
    url(r'^login/success/?$',
        TemplateView.as_view(template_name='bookstore/login_success.html'),
        name='login_success'),

    #login user
    url(r'^logout/?$',
        LogoutView.as_view(),
        name='logout'),

    #list of reviews for a certain book
    url(r'^book/(?P<book_id>[0-9]+?)/?$',
        BookReviewListView.as_view(),
        name='book_review_list'
    ),

    #list of reviews for a certain user
    url(r'^user/(?P<user_id>[0-9]+?)/?$',
        UserReviewListView.as_view(),
        name='user_review_list'
    ),
    url(r'^user/(?P<username>.+?)/?$',
        UserReviewListView.as_view(),
        name='user_review_list'
    ),
    url(r'^user/?$',
        UserListView.as_view(),
        name='user_list'
    ),

    #list of books, sorted
    url(r'^books?/?$',
        BookListView.as_view(),
        name='book_list'
    ),
    #list of author
    url(r'^author?/?$',
        AuthorListView.as_view(),
        name='author_list'
    ),
    url(r'^author/(?P<username>.+?)/?$',
        AuthorListView.as_view(),
        name='author_list'
    ),
    url(r'^Legal/?$',
        LegalListView.as_view(),
        name='legal_list'
    ),
    url(r'^About/?$',
        AboutListView.as_view(),
        name='about_list'
    ),

    url(r'^feed/$', 'feed', name='feed'),
    url(r'^contact/$', views.contact, name='contact'),
    url(r'^success',
        TemplateView.as_view(template_name='success.html'),
        name='success'),
)+static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

handler404 = 'views.my_404_view'
handler500 = 'views.my_500_view'