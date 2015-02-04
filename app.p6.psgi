#!/usr/bin/env perl6
use v6;
use lib "lib";


=begin notes

# Have an HTTP::Response type
# Extend it to Get, Post, Put, Delete...
use HTTP::UserAgent;

subset Get of HTTP::Request where -> $r { $r.method eqv "GET" };

class Ego {
    has $.env is rw;

    multi method index {
        say $?FILE.IO.abspath;
    };

    multi method index( Get ) {

    };
};

sub run (%env) {
    # my $ego = Ego.new(env => %env);
    use HTTP::Request;
    say %env<REQUEST_METHOD>, " ", %env<REQUEST_URI>;
    my $method = %env<REQUEST_METHOD>;
    say %env<REQUEST_METHOD>.WHICH;
    my $req = HTTP::Request.new;
    $req.method = %env<REQUEST_METHOD>;
    $req.url = %env<REQUEST_URI>;

    # my $req = HTTP::Request.new( %env{"REQUEST_METHOD","REQUEST_URI"} );
    # my $req = HTTP::Request.new( %env<REQUEST_METHOD REQUEST_URI> );
    # my $req = HTTP::Request.new( %env<REQUEST_METHOD> => "/" );
    #my $req = HTTP::Request.new( %env<REQUEST_METHOD> => %env<REQUEST_URI> );
    #my $req = HTTP::Request.new( GET => "/" );

    $req.print;
#    say $ego.env.


    # Setup
    # Accept request...

    # say $?FILE.IO.abspath;
    # my $env = shift;
    for %env.kv -> $key, $value {
        printf "%40s -> %s\n", $key, $value || "[NA]";
    }

};

run(%*ENV);

=begin comment

http://www.dlugosz.com/Perl6/web/eqv.html

multi method GET ( 'user', %params, *% ){ ... };
multi method GET ( /<[0-9]>+/, %params, *% ){ ... }

[16:58] <pmichaud> apv_: this one is a bit old, but may help:  https://perl6advent.wordpress.com/2011/12/24/day-24-subs-are-always-better-in-multi-ples/


[17:10] <b2gills> apv_: I've thought about having a module that you would use by defining `multi method GET ( 'user', %params, *% ){ ... }; multi method GET ( /<[0-9]>+/, %params, *% ){ ... }` etc

[17:16] <TimToady> well, in current syntax would have to be Str where /<[0..9]>+/
[17:22] == Klaudioh [~claudio@192.210.139.186] has joined #perl6

Questions:

 Is there an emacs mode for p6? https://github.com/lue/p6mode

=end comment

=end notes
