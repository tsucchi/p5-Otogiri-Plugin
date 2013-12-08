package Otogiri::Plugin;
use 5.008005;
use strict;
use warnings;

our $VERSION = "0.01";

use Otogiri;
use Class::Load;

sub load_plugin { #this code is taken from Teng's load_plugin
    my ($class, $pkg, $opt) = @_;
    $pkg = $pkg =~ s/^\+// ? $pkg : "Otogiri::Plugin::$pkg";
    Class::Load::load_class($pkg);

    $class = ref($class) if ref($class);

    my $alias = delete $opt->{alias} || +{};
    {
        no strict 'refs';
        for my $method ( @{"${pkg}::EXPORT"} ){
            *{$class . '::' . ($alias->{$method} || $method)} = $pkg->can($method);
        }
    }

    $pkg->init($class, $opt) if $pkg->can('init');
}

*Otogiri::load_plugin = \&load_plugin;



1;
__END__

=encoding utf-8

=head1 NAME

Otogiri::Plugin - make Otogiri to pluggable

=head1 SYNOPSIS

    use Otogiri;
    use Otogiri::Plugin;
    my $db = Otogiri->new( connect_info => ["dbi:SQLite:dbname=$dbfile", '', ''] );
    Otogiri::load_plugin('UsefulPlugin');
    $db->useful_method;


=head1 DESCRIPTION

Otogiri::Plugin provides L<Teng>-like plugin function to L<Otogiri>.

=head1 LICENSE

Copyright (C) Takuya Tsuchida.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Takuya Tsuchida E<lt>tsucchi@cpan.orgE<gt>

=cut

