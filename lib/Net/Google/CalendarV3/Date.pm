package Net::Google::CalendarV3::Date;

use Moose;
with 'Net::Google::CalendarV3::ToJson';
has [ qw( date dateTime timeZone ) ], is => 'ro';

1;

