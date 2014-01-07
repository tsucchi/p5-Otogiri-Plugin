[![Build Status](https://travis-ci.org/tsucchi/p5-Otogiri-Plugin.png?branch=master)](https://travis-ci.org/tsucchi/p5-Otogiri-Plugin) [![Coverage Status](https://coveralls.io/repos/tsucchi/p5-Otogiri-Plugin/badge.png?branch=master)](https://coveralls.io/r/tsucchi/p5-Otogiri-Plugin?branch=master)
# NAME

Otogiri::Plugin - make Otogiri to pluggable

# SYNOPSIS

    use Otogiri;
    use Otogiri::Plugin;
    my $db = Otogiri->new( connect_info => ["dbi:SQLite:dbname=$dbfile", '', ''] );
    Otogiri->load_plugin('UsefulPlugin');
    $db->useful_method; #derived from UsefulPlugin



# DESCRIPTION

Otogiri::Plugin provides [Teng](https://metacpan.org/pod/Teng)\-like plugin function to [Otogiri](https://metacpan.org/pod/Otogiri).

# METHODS

## $class->load\_plugin($plugin\_name, $opt)

Load plugin to Otogiri or subclass. This method is exported to Otogiri or it's subclass(not to Otogiri::Plugin namespace).
By default, plugins are loaded from Otorigi::Plugin::$plugin\_name namespace. If '+' is specified before $plugin\_name, 
plugins are loaded specified package name. for example,

    Otogiri->load_plugin('UsefulPlugin');          # loads Otogiri::Plugin::UsefulPlugin
    Otogiri->load_plugin('+Some::Useful::Plugin'); # loads Some::Useful::Plugin

You can use alias method name like this,

    Otogiri->load_plugin('UsefulPlugin', { 
        alias => {
            very_useful_method_but_has_so_long_name => 'very_useful_method', 
        }
    });

In this case, plugin provides `very_useful_method_but_has_so_long_name`, but you can access `very_useful_method`

# LICENSE

Copyright (C) Takuya Tsuchida.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

Takuya Tsuchida <tsucchi@cpan.org>
