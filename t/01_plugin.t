use strict;
use warnings;

use Test::More;
use Otogiri;
use Otogiri::Plugin;
use lib qw(./t/lib);

my $dbfile  = ':memory:';
my $db = Otogiri->new( connect_info => ["dbi:SQLite:dbname=$dbfile", '', ''] );

(ref $db)->load_plugin('TestPlugin');
ok( $db->can('test_method') );
is( $db->test_method('a', 'b', 'c'), 'this is test_method a:b:c' );

is( Otogiri::Plugin::TestPlugin::_get_init_called(), 1);

done_testing;
