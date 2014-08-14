package Net::Google::CalendarV3::Attendee;

use Moose;
with 'Net::Google::CalendarV3::ToJson';
extends 'Net::Google::CalendarV3::Person';
has [ qw( additionalGuests comment optional organizer resource responseStatus ) ], is => 'ro';

1;

