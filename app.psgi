#!/usr/bin/env perl
use 5.012;
use utf8;
use strictures;

sub {
    [ 200, [ "Content-Type" => "text/plain" ],
      [ "OHAI\n" ] ];
}

__DATA__
