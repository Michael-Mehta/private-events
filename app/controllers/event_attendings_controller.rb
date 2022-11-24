class EventAttendingsController < ApplicationController

   before_action :find_event
   before_action :find_event_attending
   before_action :authenticate_user!


   def create

    if already_attending?

        flash[:notice] = "You have already signed up for this event"

    else

        @event.event_attendings.create(event_attendee_id: current_user.id)
    end

    redirect_to @event
   end



    private

    def find_event
        @event = Event.find(params[:event_id])
    end

    def find_event_attending
        @event_attending = @event.event_attendings.find(params[:id])
    end

    def already_attending?
        Event.attending.where(event_attendee_id: current_user.id, attended_event_id:@event.id).exists?
    end
end
