package Net::Google::CalendarV3::NotificationSettings;

use Moose;
with 'Net::Google::CalendarV3::ToJson';
use Types::Standard qw( Str );

has [qw( type method )] => is => 'rw', isa => Str;

1;

