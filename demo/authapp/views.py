from django.contrib.auth.decorators import login_required
from django.http import HttpResponseRedirect
from django.shortcuts import render, get_object_or_404
from django.contrib import auth, messages
from django.urls import reverse

from authapp.forms import AuthForm, RegForm
from mainapp.models import Order


def login(request):
    if request.method == 'POST':
        form = AuthForm(data=request.POST)
        if form.is_valid():
            auth.login(request, form.get_user())
            return HttpResponseRedirect(reverse('mainapp:index'))
    else:
        form = AuthForm()
    context = {
        'title': 'авторизация',
        'form': form,
    }
    return render(request, 'authapp/login.html', context)


def register(request):
    if request.method == 'POST':
        form = RegForm(data=request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Вы успешно зарегистрировались!')
            return HttpResponseRedirect(reverse('authapp:login'))
    else:
        form = RegForm()
    context = {
        'title': 'регистрация',
        'form': form,
    }
    return render(request, 'authapp/reg.html', context)


@login_required
def logout(request):
    auth.logout(request)
    return HttpResponseRedirect(reverse('mainapp:index'))


@login_required
def profile(request):
    order = Order.objects.filter(user=request.user)
    context = {
        'title': 'Личный кабинет',
        'order': order,
    }
    return render(request, 'authapp/lk.html', context)
