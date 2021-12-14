class SlotsController < ApplicationController
  def index
    if current_user.booking.nil?
      @days = Day.all.order(date: :asc)
      @display_day = @days.first
      # Quand le champs est renseigné
      if params[:day].present?
        @display_day = Day.where(date: params[:day].to_date).first
      end
    else
      redirect_to booking_path(current_user.booking)
    end
  end
end