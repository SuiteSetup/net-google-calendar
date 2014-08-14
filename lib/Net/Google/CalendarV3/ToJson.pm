package Net::Google::CalendarV3::ToJson;

use Moose::Role;
use Kavorka;

method TO_JSON {
    return { %$self };
};

1;

