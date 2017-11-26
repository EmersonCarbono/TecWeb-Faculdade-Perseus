# -*- coding: utf-8 -*-
# Generated by Django 1.11.6 on 2017-11-24 12:56
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import django.db.models.manager
import usuario.models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('curriculo', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Usuario',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('nome', models.CharField(max_length=150)),
                ('email', models.EmailField(max_length=254)),
                ('ra', models.IntegerField(unique=True)),
                ('password', models.CharField(max_length=150)),
                ('celular', models.CharField(max_length=11)),
                ('perfil', models.CharField(default='C', max_length=1)),
                ('ativo', models.BooleanField(default=True)),
            ],
            options={
                'abstract': False,
            },
            managers=[
                ('object', usuario.models.UsuarioManager()),
            ],
        ),
        migrations.CreateModel(
            name='Aluno',
            fields=[
                ('usuario_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to=settings.AUTH_USER_MODEL)),
                ('curso', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='curriculo.Curso')),
            ],
            options={
                'abstract': False,
            },
            bases=('usuario.usuario',),
            managers=[
                ('objects', django.db.models.manager.Manager()),
                ('object', usuario.models.UsuarioManager()),
            ],
        ),
        migrations.CreateModel(
            name='Coordenador',
            fields=[
                ('usuario_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'abstract': False,
            },
            bases=('usuario.usuario',),
            managers=[
                ('objects', django.db.models.manager.Manager()),
                ('object', usuario.models.UsuarioManager()),
            ],
        ),
        migrations.CreateModel(
            name='Professor',
            fields=[
                ('usuario_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to=settings.AUTH_USER_MODEL)),
                ('apelido', models.CharField(max_length=30)),
            ],
            options={
                'abstract': False,
            },
            bases=('usuario.usuario',),
            managers=[
                ('objects', django.db.models.manager.Manager()),
                ('object', usuario.models.UsuarioManager()),
            ],
        ),
    ]