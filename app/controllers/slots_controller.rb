class SlotsController < ApplicationController
  def index
    if current_user.booking.nil?
      @days = Day.all.order(date: :asc)
    else
      redirect_to booking_path(current_user.booking)
    end
  end
end