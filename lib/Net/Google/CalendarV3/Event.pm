package Net::Google::CalendarV3::Event;

use Moose;
with 'Net::Google::CalendarV3::ToJson';
use Kavorka;
use Try::Tiny;
use Types::Standard qw( Str Int Bool ArrayRef Enum);
use Net::Google::CalendarV3::Types qw( Person Attendee Date);

has [ qw( kind etag creator organizer attendees created
        endTimeUnspecified extendedProperties gadget
        hangoutLink htmlLink iCalUID locked originalStartTime
        privateCopy recurringEventId reminders source start end
        updated
    ) ], is => 'ro';
has [ qw( anyoneCanAddSelf attendeesOmitted colorId description
        guestsCanInviteOthers guestsCanSeeOtherGuests
        id location recurrence sequence status summary
        transparency visibility
    ) ], is => 'rw';

has '+kind' => default => 'calendar#event';

has [ qw( +creator +organizer ) ], isa => Person, coerce => 1;
has '+attendees', isa => ArrayRef[Attendee], coerce => 1;
has [ qw( +anyoneCanAddSelf +attendeesOmitted
        +guestsCanInviteOthers +guestsCanSeeOtherGuests
        +locked +privateCopy
    ) ], isa => Bool;

has [qw( +start +end +originalStartTime )], isa => Date, coerce => 1;

has '+status',       isa => Enum[qw(confirmed tentative cancelled)];
has '+transparency', isa => Enum[qw(opaque transparent)];
has '+visibility',   isa => Enum[qw(default public private confidential)];


=pod
{
  "kind": "calendar#event",
  "etag": etag,
  "id": string,
  "status": string,
  "htmlLink": string,
  "created": datetime,
  "updated": datetime,
  "summary": string,
  "description": string,
  "location": string,
  "colorId": string,
  "creator": {
    "id": string,
    "email": string,
    "displayName": string,
    "self": boolean
  },
  "organizer": {
    "id": string,
    "email": string,
    "displayName": string,
    "self": boolean
  },
  "start": {
    "date": date,
    "dateTime": datetime,
    "timeZone": string
  },
  "end": {
    "date": date,
    "dateTime": datetime,
    "timeZone": string
  },
  "endTimeUnspecified": boolean,
  "recurrence": [
    string
  ],
  "recurringEventId": string,
  "originalStartTime": {
    "date": date,
    "dateTime": datetime,
    "timeZone": string
  },
  "transparency": string,
  "visibility": string,
  "iCalUID": string,
  "sequence": integer,
  "attendees": [
    {
      "id": string,
      "email": string,
      "displayName": string,
      "organizer": boolean,
      "self": boolean,
      "resource": boolean,
      "optional": boolean,
      "responseStatus": string,
      "comment": string,
      "additionalGuests": integer
    }
  ],
  "attendeesOmitted": boolean,
  "extendedProperties": {
    "private": {
      (key): string
    },
    "shared": {
      (key): string
    }
  },
  "hangoutLink": string,
  "gadget": {
    "type": string,
    "title": string,
    "link": string,
    "iconLink": string,
    "width": integer,
    "height": integer,
    "display": string,
    "preferences": {
      (key): string
    }
  },
  "anyoneCanAddSelf": boolean,
  "guestsCanInviteOthers": boolean,
  "guestsCanModify": boolean,
  "guestsCanSeeOtherGuests": boolean,
  "privateCopy": boolean,
  "locked": boolean,
  "reminders": {
    "useDefault": boolean,
    "overrides": [
      {
        "method": string,
        "minutes": integer
      }
    ]
  },
  "source": {
    "url": string,
    "title": string
  }
}
=cut

1;

