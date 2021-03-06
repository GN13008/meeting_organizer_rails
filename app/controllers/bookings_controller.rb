class BookingsController < ApplicationController
  def index
    @days = Day.all.order(date: :asc)
    @display_day = @days.first
    # Quand le champs est renseigné
    if params[:day].present?
      @display_day = Day.where(date: params[:day].to_date).first
    end
    @bookings = @display_day.bookings.where(agent_id: current_user.agent.id)
  end

  def create
    @booking = Booking.new()
    @slot = Slot.find(params[:slot_id])
    agents = Agent.all
    agent_availables = agents.select do |agent|
      !(agent.slots.where(id: @slot.id).length.positive?)
    end
    @booking.agent = agent_availables.sample
    @booking.slot = @slot
    @booking.user = current_user

    if @booking.save
      flash.alert = "Votre réservation est confirmée"
      redirect_to booking_path(@booking)
    else
      flash.alert = "Echec de la réservation"
      redirect_to slots_path
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end
end
