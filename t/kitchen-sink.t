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
    $t->get_returns_200("/");

    done_testing();
};


done_testing(2);

__DATA__
