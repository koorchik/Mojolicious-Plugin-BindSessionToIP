use Mojo::Base -strict;

use Test::More;

use Mojolicious::Lite;
use Test::Mojo;

plugin 'BindSessionToIP';

get '/fill_session' => sub {
    my $self = shift;
    $self->session( 'status' => 'AUTHENTICATED' );
    $self->render_text('DONE');
};

get '/check_session' => sub {
    my $self = shift;
    $self->render_text( $self->session( 'status') );
};

my $t = Test::Mojo->new;
$t->get_ok('/fill_session')->status_is(200)->content_is('DONE');
$t->get_ok('/check_session')->status_is(200)->content_is('AUTHENTICATED');


done_testing;