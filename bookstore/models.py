#bookstore/models.py
#Rolph Recto

from django.contrib.auth.models import User
from django.db import models
#from bootstrap3_datetime.widgets import DateTimePicker

from django.core.exceptions import ValidationError

from bookstore import util
from ckeditor.fields import RichTextField


class Author(models.Model):
    """Model class for authors"""
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    author_text = RichTextField()
    timestamp = models.DateField()
    img_patch = models.FileField(upload_to='authors/%Y/%m/%d')

    def __unicode__(self):
        return self.first_name + " " + self.last_name


class Link(models.Model):
    """Model class for authors"""

    title = models.CharField(max_length=50)
    context = RichTextField()
    a_link = models.CharField(max_length=50)
    timestamp = models.DateField()

    def __unicode__(self):
        return self.title + " " + self.context

class About(models.Model):
    """Model class for authors"""

    title = models.CharField(max_length=50)
    context = RichTextField()
    a_link = models.CharField(max_length=50)
    timestamp = models.DateField()

    def __unicode__(self):
        return self.title + " " + self.context


class Contact(models.Model):
    """Model class for authors"""

    contact_name = models.CharField(max_length=50)
    contact_email = models.CharField(max_length=50)
    message_title = models.CharField(max_length=50)
    message_context = RichTextField()
    timestamp = models.DateField()

    def __unicode__(self):
        return self.contact_email + " " + self.message_title

class Advertisment(models.Model):
    """Model class for authors"""

    title = models.CharField(max_length=50)
    context = RichTextField()
    a_link = models.CharField(max_length=50)
    timestamp = models.DateField()
    img_patch = models.FileField(upload_to='advertisment/%Y/%m/%d')

    def __unicode__(self):
        return self.title + " " + self.context



class Legal (models.Model):
    """Model class for authors"""

    legal_title = models.TextField()
    legal_context = RichTextField()
    timestamp = models.DateField()
    def __unicode__(self):
        return self.legal_title + " " + self.legal_context

class Notice (models.Model):
    """Model class for Notice"""

    notice_title = models.TextField()
    notice_context = RichTextField()
    timestamp = models.DateField()
    def __unicode__(self):
        return self.notice_title + " " + self.notice_context


class Day (models.Model):
    """Model class for Notice"""

    context = RichTextField()
    timestamp = models.DateField()
    def __unicode__(self):
        return self.context



class Book(models.Model):
    """Model class for books"""

    title = models.CharField(max_length=150)
    author = models.ForeignKey(Author)
    content = RichTextField()
    img_patch = models.FileField(upload_to='documents/%Y/%m/%d')
    #we're assuming that no book is published before 0 A.D.
    publication_year = models.IntegerField(null=True,
        validators=[util.not_negative])

    def __unicode__(self):
        return self.title


class Review(models.Model):
    """Model class for user reviews of books"""

    user = models.ForeignKey(User)
    book = models.ForeignKey(Book)
    timestamp = models.DateField()
    img_patch_review = models.FileField(upload_to='review/%Y/%m/%d')
    #what the user had to say about the book
    review_message = RichTextField()
    #ratings go from 1-5
    rating = models.IntegerField(
        choices=(
            (1, '1'),
            (2, '2'),
            (3, '3'),
            (4, '4'),
            (5, '5'),
        )
    )

    def __unicode__(self):
        return self.user.username + " : " + self.book.title
