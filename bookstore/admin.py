#bookstore/admin.py
#by Rolph Recto

from django.contrib import admin
from bookstore.models import Author, Book, Review, Legal, Link, Advertisment, Contact, About, Notice, Day
  
class AuthorAdmin(admin.ModelAdmin):
    """ModelAdmin class for Author model"""
    list_display = ('pk', 'last_name', 'first_name', )
    search_fields = ('pk', 'first_name', 'last_name',)

class LinkAdmin(admin.ModelAdmin):
    """ModelAdmin class for Author model"""
    list_display = ('pk', 'title', 'context','a_link' )
    search_fields = ('pk', 'title', 'context','a_link',)

class AdvertismentAdmin(admin.ModelAdmin):
    """ModelAdmin class for Author model"""
    list_display = ('pk', 'title', 'context','a_link','img_patch', )
    search_fields = ('pk', 'title', 'context','a_link','img_patch',)

class ContactAdmin(admin.ModelAdmin):
    """ModelAdmin class for Author model"""
    list_display = ('pk','contact_email', 'message_title', 'message_context','timestamp', )
    search_fields = ('pk', 'contact_email','message_title', 'message_context','timestamp',)

class BookAdmin(admin.ModelAdmin):
    """ModelAdmin class for Book model"""
    list_display = ('pk', 'title', 'author', 'publication_year','img_patch')
    search_fields = ('title',)
    ordering = ('publication_year', 'title',)

class ReviewAdmin(admin.ModelAdmin):
    """"ModelAdmin class for Review model"""
    list_display = ('pk', 'user', 'book', 'rating', 'timestamp')
    date_hierarchy = 'timestamp'
    ordering = ('timestamp',)

class LegalAdmin(admin.ModelAdmin):
    """"Lega Admin"""
    list_display = ('pk', 'legal_context', 'legal_title', 'timestamp')
    date_hierarchy = 'timestamp'
    ordering = ('timestamp',)

class AboutAdmin(admin.ModelAdmin):
    """"Lega Admin"""
    list_display = ('pk', 'title', 'context', 'timestamp')
    date_hierarchy = 'timestamp'
    ordering = ('timestamp',)

class NoticeAdmin(admin.ModelAdmin):
    """"Lega Admin"""
    list_display = ('pk', 'notice_title', 'notice_context', 'timestamp')
    date_hierarchy = 'timestamp'
    ordering = ('timestamp',)

class DayAdmin(admin.ModelAdmin):
    """"Lega Admin"""
    list_display = ('pk', 'context', 'timestamp')
    date_hierarchy = 'timestamp'
    ordering = ('timestamp',)


admin.site.register(Author, AuthorAdmin)
admin.site.register(Book, BookAdmin)
admin.site.register(Legal, LegalAdmin)
admin.site.register(Review, ReviewAdmin)
admin.site.register(Link, LinkAdmin)
admin.site.register(Advertisment, AdvertismentAdmin)
admin.site.register(Contact, ContactAdmin)
admin.site.register(About, AboutAdmin)
admin.site.register(Notice, NoticeAdmin)
admin.site.register(Day, DayAdmin)

