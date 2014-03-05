#!/usr/bin/env perl
use 5.012;
use utf8;
use strictures;
use Plack::Builder;
use Plack::App::File;
use Path::Tiny;

my $self = path(__FILE__);

my $app = sub {
    [ 200, [ "Content-Type" => "text/plain" ],
      [ "OHAI\n" ] ];
};

builder {
    mount "/favicon.ico" => Plack::App::File->new(file => path($self->parent, "root/static/img/v-squared.ico"))->to_app;
    mount "/" => $app;
};


__DATA__
