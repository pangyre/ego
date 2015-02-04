use inc::Module::Install;
name 'Ego';
version '0.01';
all_from "lib/Ego.pm";

requires "Module::CPANfile";

cpanfile;

WriteAll;

__END__

 carton exec perl Makefile.PL

 rm -f META.yml ; perl Makefile.PL

