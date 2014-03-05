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

 /tmp/uwsgi --uid apache --http :3031 --psgi app.psgi --http-modifier1 5 --processes 4 --master

Plain text log all DB operations so it can be replayed from start?

Editing should be done in emacs or with Curses or something, yeah? So,
you use the API to GET a JSON representation of the post. Edit it
locally. PUT it back. POST an empty to get an id/template. Ids expire?
If guids, they don't have to. They just don't go in the DB till there
is a full item.

DB:

 Blog
 Post (only, que no? comments are responses, tagging/templating/owner should define what a thing is.)
 Tag
 User
 PostUserTag

Post
 pk=id (short guid?)
 pk=guiid (for sharing)
 title (optional, repeatable)
 body (optional, repeatable)

User
 id, local only tied to externality

PostUser
 post.user
 
 
