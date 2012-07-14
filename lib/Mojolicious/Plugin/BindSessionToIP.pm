package Mojolicious::Plugin::BindSessionToIP;
use Mojo::Base 'Mojolicious::Plugin';

our $VERSION = '0.01';

sub register {
  my ($self, $app) = @_;
}

1;
__END__

=head1 NAME

Mojolicious::Plugin::BindSessionToIP - Mojolicious Plugin

=head1 SYNOPSIS

  # Mojolicious
  $self->plugin('BindSessionToIP');

  # Mojolicious::Lite
  plugin 'BindSessionToIP';

=head1 DESCRIPTION

L<Mojolicious::Plugin::BindSessionToIP> is a L<Mojolicious> plugin.

=head1 METHODS

L<Mojolicious::Plugin::BindSessionToIP> inherits all methods from
L<Mojolicious::Plugin> and implements the following new ones.

=head2 C<register>

  $plugin->register($app);

Register plugin in L<Mojolicious> application.

=head1 SEE ALSO

L<Mojolicious>, L<Mojolicious::Guides>, L<http://mojolicio.us>.

=cut
