http://uwsgi-docs.readthedocs.org/en/latest/PSGIquickstart.html

= Install

== Build uWSGI

 wget http://projects.unbit.it/downloads/uwsgi-latest.tar.gz
 tar zxvf uwsgi-latest.tar.gz
 cd uwsgi*
 env UWSGI_PROFILE=psgi make

    OR

 curl http://uwsgi.it/install | bash -s psgi /tmp/uwsgi
 ############## end of uWSGI configuration #############
 total build time: 19 seconds
 *** uWSGI is ready, launch it with /tmp/uwsgi ***

 /tmp/uwsgi --http :8080 --http-modifier1 5 --psgi app.psgi


 uwsgi --socket 127.0.0.1:3031 --psgi myapp.pl
 location / {
    include uwsgi_params;
    uwsgi_pass 127.0.0.1:3031;
    uwsgi_modifier1 5;
 }

 /tmp/uwsgi --socket 127.0.0.1:3031 --psgi app.psgi --processes 4 --master

 /tmp/uwsgi --http 3031 --psgi app.psgi --http-modifier1 5 --processes 4 --master


