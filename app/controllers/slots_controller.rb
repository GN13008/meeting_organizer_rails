class SlotsController < ApplicationController
  def index
    if current_user.booking.nil?
      @slots = Slot.where("nb_agent > 0").order(date: :asc)
    else
      redirect_to booking_path(current_user.booking)
    end
  end
end