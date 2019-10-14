docker build -t wozhangkun/nginx-phpfpm:7.0_yulian .

docker run -d --name nginx --restart=unless-stopped -v /etc/nginx/conf.d:/etc/nginx/conf.d -v /etc/nginx/certs:/etc/nginx/certs -v /var/www/html:/var/www/html -v /var/log/nginx:/var/log/nginx -p 80:80 -p 443:443 wozhangkun/nginx-phpfpm:7.0_yulian

docker cp nginx:/etc/nginx/conf.d/www.conf /etc/nginx/conf.d/

docker service create -p 80:80 --mount type=bind,src=/var/www/html,dst=/var/www/html --mount type=bind,src=/etc/nginx/conf.d/,dst=/etc/nginx/conf.d/ --mount type=bind,src=/var/log/nginx,dst=/var/log/nginx --mount type=bind,src=/etc/nginx/certs,dst=/etc/nginx/certs --name nginx wozhangkun/nginx-phpfpm:7.0_yulian
