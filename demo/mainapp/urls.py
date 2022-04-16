from django.urls import path

import mainapp.views as mainapp

app_name = 'mainapp'

urlpatterns = [
    path('', mainapp.index, name='index'),
    path('products/', mainapp.all_products, name='all_products'),
    path('order/<int:pk>/', mainapp.order, name='order'),
    path('order/add/<int:pk>/', mainapp.add_order, name='add_order'),
]
