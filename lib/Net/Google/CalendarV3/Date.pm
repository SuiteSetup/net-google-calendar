package Net::Google::CalendarV3::Date;

use Moose;
use Kavorka;
use DateTime::Format::ISO8601;
with 'Net::Google::CalendarV3::ToJson';
use Net::Google::CalendarV3::Types qw(DateTime);
use Types::Standard qw( Bool );
has $_, is => 'ro', clearer => "clear_$_" for qw( date dateTime timeZone );

method set (DateTime $dt, Bool $is_all_day) {
    if ($is_all_day) {
        $self->date($dt->ymd);
        $self->clear_dateTime;
        $self->clear_timeZone;
    } else {
        $self->dateTime($dt->iso8601);
        $self->timeZone($dt->time_zone->name);
        $self->clear_date;
    }
}

method get () {
    if ($self->date) {
        return ( DateTime::Format::ISO8601->parse_datetime($self->date), 1 );
    } else {
        my $dt = DateTime::Format::ISO8601->parse_datetime($self->dateTime);
        $dt->set_time_zone($self->timeZone) if $self->timeZone;
        return ( $dt, 0 );
    }
}

1;

