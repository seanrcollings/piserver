server {
    server_name api.pisite.seanrcollings.com 10.0.0.224;

    location / {
        include uwsgi_params;
        uwsgi_pass unix:/var/www/pisite/pisite.sock;
	add_header Access-Control-Allow-Origin *;
	add_header Access-Control-Max-Age 3600;
	add_header Access-Control-Expose-Headers Content-Length;
	add_header Access-Control-Allow-Headers Range;
    }
	location /static {
		alias /var/www/pisite/app/static;
	}

}
