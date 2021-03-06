from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseRedirect
from django.shortcuts import render, get_object_or_404
from django.urls import reverse

from mainapp.models import Products, Order, Category


def index(request):
    products = Products.objects.all()[0:6]
    context = {
        'title': 'главная',
        'products': products,
    }
    return render(request, 'mainapp/index.html', context)


def places(request):
    category = Category.objects.all()
    if 'search' in request.GET:
        search_title = request.GET['search']
        products = Products.objects.filter(category__name__icontains=search_title)
    else:
        products = Products.objects.all()
    context = {
        'products': products,
        'category': category,
    }
    return render(request, 'mainapp/order_type_catalog.html', context)


def all_products(request):
    products = Products.objects.all()
    category = Category.objects.all()
    context = {
        'title': 'все товары',
        'products': products,
        'category': category,
    }
    return render(request, 'mainapp/all_products.html', context)


def order(request, pk):
    product = get_object_or_404(Products, id=pk)
    context = {
        'title': product.title,
        'product': product,
    }
    return render(request, 'mainapp/order.html', context)


@login_required
def add_order(request, pk):
    product = get_object_or_404(Products, id=pk)
    Order.objects.get_or_create(
        user=request.user,
        products=product
    )
    messages.success(request, 'Вы успешно заказали товар!')
    return HttpResponseRedirect(
        reverse('mainapp:order', kwargs={'pk': product.id})
    )


def places_order_set(request, order_type):
    request.session['places_order_set'] = order_type
    print(order_type)
    return HttpResponseRedirect(request.META['HTTP_REFERER'])
