use inc::Module::Install;
name 'Ego';
version '0.01';
all_from "lib/Ego.pm";

requires 'Plack', 0.9980;

cpanfile;

WriteAll;

__END__

 rm -f META.yml ; perl Makefile.PL

