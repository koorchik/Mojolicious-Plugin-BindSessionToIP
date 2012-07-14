use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  NAME         => 'Mojolicious::Plugin::BindSessionToIP',
  VERSION_FROM => 'lib/Mojolicious/Plugin/BindSessionToIP.pm',
  AUTHOR       => 'A Good Programmer <nospam@cpan.org>',
  PREREQ_PM    => {'Mojolicious' => '3.08'},
  test         => {TESTS => 't/*.t'}
);
