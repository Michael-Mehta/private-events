class Event < ApplicationRecord

    belongs_to :creator, class name: "User"
    has_many :event_attendings, foreign_key: "attended_event_id"
    has_many :attendees, through: :event_attendings, source: :event_attendee

    scope :past, -> {where('event_date > ?', DateTime.now)}
    scope :future -> {where('event_date < ?', DateTime.now)}
end
