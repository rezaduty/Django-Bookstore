from django.conf.urls import patterns, include, url

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'django_bookstore.views.home', name='home'),
    # url(r'^django_bookstore/', include('django_bookstore.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),

    #bookstore app
    url(r'^',
        include('bookstore.urls', namespace='bookstore', app_name='bookstore')
    ),

    url(r'^captcha/', include('captcha.urls')),
    #url(r"^account/", include("account.urls")),
    
)+static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
