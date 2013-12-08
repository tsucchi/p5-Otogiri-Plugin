[![Build Status](https://travis-ci.org/tsucchi/p5-Otogiri-Plugin.png?branch=master)](https://travis-ci.org/tsucchi/p5-Otogiri-Plugin)
# NAME

Otogiri::Plugin - make Otogiri to pluggable

# SYNOPSIS

    use Otogiri;
    use Otogiri::Plugin;
    my $db = Otogiri->new( connect_info => ["dbi:SQLite:dbname=$dbfile", '', ''] );
    Otogiri::load_plugin('UsefulPlugin');
    $db->useful_method;



# DESCRIPTION

Otogiri::Plugin provides [Teng](http://search.cpan.org/perldoc?Teng)\-like plugin function to [Otogiri](http://search.cpan.org/perldoc?Otogiri).

# LICENSE

Copyright (C) Takuya Tsuchida.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

Takuya Tsuchida <tsucchi@cpan.org>
