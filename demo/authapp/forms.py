from django.contrib.auth.forms import AuthenticationForm, UserCreationForm

from authapp.models import MyUser


class AuthForm(AuthenticationForm):
    class Meta:
        model = MyUser
        field = (
            'username',
            'password',
        )

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for name, item in self.fields.items():
            item.widget.attrs['class'] = 'form-control'
            item.help_text = ''


class RegForm(UserCreationForm):
    class Meta:
        model = MyUser
        fields = (
            'first_name',
            'last_name',
            'patronymic',
            'username',
            'email',
            'password1',
            'password2',
        )

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for name, item in self.fields.items():
            item.widget.attrs['class'] = 'form-control'
            item.help_text = ''
