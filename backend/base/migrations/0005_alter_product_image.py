# Generated by Django 4.2.2 on 2023-06-16 19:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('base', '0004_review_createdat_alter_order_createdat_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='image',
            field=models.ImageField(blank=True, default='/placeholder.png', null=True, upload_to=''),
        ),
    ]
