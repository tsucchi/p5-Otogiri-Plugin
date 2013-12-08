package Otogiri::Plugin::TestPlugin;
use strict;
use warnings;
our @EXPORT = qw(test_method);

sub test_method {
    my ($self, @args) = @_;
    return 'this is test_method ' . join(':', @args);
}

1;
