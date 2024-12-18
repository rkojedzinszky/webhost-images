# webhost-images

Simple ssh image and apache based images to serve static/php content.

For web images the to-be server content should be placed under /var/www/html.

## Apache+PHP-FPM

By default the php images will use apache+mod_php to run PHP code. Howewer, if needed, the image can be used to run PHP code
with php-fpm. For this, two containers shall be started, one with command `httpd-php-fpm`, and the other with `php-fpm`.
The two containers must share a common `/tmp` where the php-fpm socket will be placed.
