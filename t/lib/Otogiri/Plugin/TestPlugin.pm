package Otogiri::Plugin::TestPlugin;
use strict;
use warnings;
our @EXPORT = qw(test_method very_useful_method_but_has_so_long_name);

my $init_called = 0;

sub init {
    my ($self) = @_;
    $init_called = 1;
}

sub test_method {
    my ($self, @args) = @_;
    return 'this is test_method ' . join(':', @args);
}

sub very_useful_method_but_has_so_long_name {
    my ($self, @args) = @_;
    return 'long method name desune';
}

sub _get_init_called {
    return $init_called;
}

1;
