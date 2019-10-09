docker build -t wozhangkun/nginx-phpfpm_yulian:7.0 .

docker run -d --name nginx --restart=unless-stopped -v /etc/nginx/conf.d:/etc/nginx/conf.d -v /etc/nginx/certs:/etc/nginx/certs -v /var/www/html:/var/www/html -v /var/log/nginx:/var/log/nginx -p 80:80 -p 443:443 wozhangkun/nginx-phpfpm_yulian:7.0

docker cp nginx:/etc/nginx/conf.d/www.conf /etc/nginx/conf.d/
