class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if user_signed_in?
      if current_user.agent.nil?
        # user is log in and is a client -> redirect to slots index
        redirect_to slots_path
      else
        # user is log in and is a agent -> redirect to bookings index
        redirect_to bookings_path
      end
    else
      # user is not log in
      redirect_to new_user_session_path
    end
  end
end
