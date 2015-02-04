use inc::Module::Install;
name 'Ego';
version '0.01';
all_from "lib/Ego.pm";

requires 'Plack', 0.9980;
requires 'Starman', 0.2000;

cpanfile;

WriteAll;

__END__

 rm -f META.yml ; perl Makefile.PL

