package Net::Google::CalendarV3::Person;

use Moose;
with 'Net::Google::CalendarV3::ToJson';
has [ qw( id email displayName self ) ], is => 'ro';

1;

