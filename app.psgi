#!/usr/bin/env perl
use 5.012;
use FindBin;
use lib "$FindBin::Bin/lib";
use utf8;
use Path::Tiny;
use strictures;
use Plack::Builder;
use Plack::App::File;

my $app = sub {
    [ 200, [ "Content-Type" => "text/plain" ],
      [ "OHAI ", uc(qx{whoami}), $/ ] ];
};

my $self = path(__FILE__);
my $favicon = Plack::App::File
    ->new( file => path( $self->parent, "root/static/img/v-squared.ico" ) );

builder {
    mount "/favicon.ico" => $favicon->to_app;
    mount "/" => $app;
};

__DATA__
