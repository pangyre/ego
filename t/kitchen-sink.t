use 5.016;
use strictures;
use utf8;
use open qw( :encoding(UTF-8) :std );
use Test::More;
use Test::Exception;
use Plack::Test::Simple;
use File::Spec;
use Path::Tiny;

my $psgi = path( File::Spec->rel2abs(__FILE__), "../../app.psgi" );

ok -e $psgi->realpath, $psgi->realpath . " is there";

subtest "Basic browsing" => sub {
    my $t = Plack::Test::Simple->new( $psgi->realpath );
    for my $p ( "", qw{ u p x 3 - . } )
    {
        $t->get_returns_200("/$p", undef, "GET /$p");
    }
    done_testing(7);
};


done_testing(2);

__DATA__

subtest "Sign-up as a user" => sub {
    my $t = Plack::Test::Simple->new( $psgi->realpath );
    my $tx = $t->transaction( POST => "/u",
                              { name => "SomeUser" });

    $tx->status_is(202, "POST to /u is 202");

    done_testing();
};

=encoding utf8

=head1 Name

C<kitchen-sink.t>.

=head1 Synopsis

  carton exec 'prove t -v'

=head1 See Also

L<Ego::Manual>.


=cut
