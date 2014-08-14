package Net::Google::CalendarV3::DefaultReminder;

use Moose;
with 'Net::Google::CalendarV3::ToJson';
use Types::Standard qw( Str Int );

has method  => is => 'rw', isa => Str;
has minutes => is => 'rw', isa => Int;

1;

