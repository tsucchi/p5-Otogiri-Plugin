package Otogiri::Plugin;
use 5.008005;
use strict;
use warnings;

our $VERSION = "0.01";

use Otogiri;
use Module::Load;

sub load_plugin { #this code is taken from Teng/SQL::Maker's load_plugin
    my ($class, $pkg, $opt) = @_;
    $pkg = $pkg =~ s/^\+// ? $pkg : "Otogiri::Plugin::$pkg";
    Module::Load::load($pkg);

    $class = ref($class)     if ref($class);
    $class = 'DBIx::Otogiri' if ( $class eq 'Otogiri' );

    my $alias = delete $opt->{alias} || +{};
    {
        no strict 'refs';
        for my $method ( @{"${pkg}::EXPORT"} ){
            *{$class . '::' . ($alias->{$method} || $method)} = $pkg->can($method);
        }
    }

    $pkg->init($class, $opt) if $pkg->can('init');
}

*Otogiri::load_plugin       = \&load_plugin;
*DBIx::Otogiri::load_plugin = \&load_plugin;



1;
__END__

=encoding utf-8

=head1 NAME

Otogiri::Plugin - make Otogiri to pluggable

=head1 SYNOPSIS

    use Otogiri;
    use Otogiri::Plugin;
    my $db = Otogiri->new( connect_info => ["dbi:SQLite:dbname=$dbfile", '', ''] );
    Otogiri->load_plugin('UsefulPlugin');
    $db->useful_method; #derived from UsefulPlugin


=head1 DESCRIPTION

Otogiri::Plugin provides L<Teng>-like plugin function to L<Otogiri>.

=head1 METHODS

=head2 $class->load_plugin($plugin_name, $opt)

Load plugin to Otogiri or subclass. This method is exported to Otogiri or it's subclass(not to Otogiri::Plugin namespace).
By default, plugins are loaded from Otorigi::Plugin::$plugin_name namespace. If '+' is specified before $plugin_name, 
plugins are loaded specified package name. for example,

    Otogiri->load_plugin('UsefulPlugin');          # loads Otogiri::Plugin::UsefulPlugin
    Otogiri->load_plugin('+Some::Useful::Plugin'); # loads Some::Useful::Plugin

You can use alias method name like this,

    Otogiri->load_plugin('UsefulPlugin', { 
        alias => {
            very_useful_method_but_has_so_long_name => 'very_useful_method', 
        }
    });

In this case, plugin provides C<very_useful_method_but_has_so_long_name>, but you can access C<very_useful_method>

=head1 LICENSE

Copyright (C) Takuya Tsuchida.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Takuya Tsuchida E<lt>tsucchi@cpan.orgE<gt>

=cut

