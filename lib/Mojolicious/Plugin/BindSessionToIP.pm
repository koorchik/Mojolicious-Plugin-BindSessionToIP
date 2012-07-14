package Mojolicious::Plugin::BindSessionToIP;
use Mojo::Base 'Mojolicious::Plugin';

our $VERSION = '0.01';
use v5.10;
use Data::Dumper;

sub register {
    my ( $self, $app ) = @_;

    $app->hook(
        after_static_dispatch => sub {
            my ($c) = @_;

            my $stored_ip = $c->session('bind_session_to_ip.ip') // '';
            my $req_ip    = $self->_get_ip($c);

            if ( $stored_ip ne $req_ip ) {
                if ($stored_ip) {
                    my $path = $c->tx->req->url->to_abs->to_string;
                    $c->app->log->debug("BindSessionToIP: Ip changed from [$stored_ip] to [$req_ip]");
                }

                $self->_destroy_session($c);
                $c->session('bind_session_to_ip.ip' => $req_ip);
            }

            return 1;
        },
    );
}

sub _get_ip {
    my ( $self, $c ) = @_;
    return $c->tx->remote_address || $c->req->headers->header('X-Real-IP');
}

sub _destroy_session {
    my ( $self, $c ) = @_;
    my $session = $c->session;
    #%$session = (); # Tests hags with this o_O
    
    foreach my $key (keys %$session) {
        $session->{$key} = '';
    } 
}

1;
__END__

=head1 NAME

Mojolicious::Plugin::BindSessionToIP - Binds your Mojolicious session to IP-address for better security of your application

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
