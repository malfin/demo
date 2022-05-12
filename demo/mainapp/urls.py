from django.urls import path

import mainapp.views as mainapp

app_name = 'mainapp'

urlpatterns = [
    path('', mainapp.index, name='index'),
    path('products/', mainapp.all_products, name='all_products'),
    path('order/<int:pk>/', mainapp.order, name='order'),

    path('products/order/', mainapp.places, name='places'),
    path('products/order/places_order_set/<int:pk>/', mainapp.places_order_set, name='places_order_set'),

    # path('search/', mainapp.search, name='search'),
]
