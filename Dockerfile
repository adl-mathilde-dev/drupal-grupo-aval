FROM drupal:10-apache

# Instala Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Ejecuta comandos post instalación
RUN composer install --no-interaction --no-dev --optimize-autoloader \
 && mkdir -p /var/www/html/sites/default/files/translations \
 && cp /var/www/html/sites/default/default.settings.php /var/www/html/sites/default/settings.php \
 && chmod 664 /var/www/html/sites/default/settings.php \
 && chown -R www-data:www-data /var/www/html/sites/default/files /var/www/html/sites/default/settings.php
