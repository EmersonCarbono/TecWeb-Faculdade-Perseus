# -*- coding: utf-8 -*-
# Generated by Django 1.11.6 on 2017-11-27 16:31
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Curso',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('sigla', models.CharField(max_length=5)),
                ('nome', models.CharField(max_length=50)),
                ('tipo', models.CharField(max_length=50)),
                ('carga_horaria', models.IntegerField(default=1000)),
                ('descricao_basica', models.TextField()),
                ('descricao_completa', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='Disciplina',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nome', models.CharField(max_length=240, unique=True)),
                ('carga_horaria', models.IntegerField()),
                ('teoria', models.DecimalField(decimal_places=0, max_digits=3)),
                ('pratica', models.DecimalField(decimal_places=0, max_digits=3)),
                ('ementa', models.TextField()),
                ('competencias', models.TextField()),
                ('habilidades', models.TextField()),
                ('conteudo', models.TextField()),
                ('bibliografia_basica', models.TextField()),
                ('bibliografia_complementar', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='DisciplinaOfertada',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ano', models.SmallIntegerField()),
                ('semestre', models.CharField(max_length=1)),
            ],
        ),
        migrations.CreateModel(
            name='GradeCurricular',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ano', models.IntegerField()),
                ('semestre', models.CharField(max_length=1)),
            ],
        ),
        migrations.CreateModel(
            name='Periodo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('numero', models.SmallIntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='Turma',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('id_turma', models.CharField(max_length=1)),
                ('turno', models.CharField(max_length=15)),
                ('cursos', models.ManyToManyField(to='curriculo.Curso')),
                ('disciplina_ofertada', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='curriculo.DisciplinaOfertada')),
            ],
        ),
    ]
