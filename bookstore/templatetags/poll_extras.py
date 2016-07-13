from django import template
import datetime
from bookstore.models import Link, Advertisment, Review, Notice, Day
from random import randint

register = template.Library()

@register.assignment_tag
def get_advertisment():
    return Advertisment.objects.all()
@register.assignment_tag
def get_link():
    return Link.objects.all()
@register.assignment_tag
def get_review():
    return Review.objects.latest('pk')
@register.filter(name='addcss')
def addcss(field, css):
   return field.as_widget(attrs={"class":css})
@register.assignment_tag
def get_notice():
    return Notice.objects.order_by('id').reverse()[0:3]
@register.assignment_tag
def get_day():

    #count=Day.objects.count()
    #rand=randint(4,count-1)
    return Day.objects.filter(id=1)

