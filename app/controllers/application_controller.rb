class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :calculate_total_due, if: :user_signed_in?

  private
    def calculate_total_due
      sum = 0
      EventRegistration.where(user: current_user).each do |registration|
        sum += registration.amount
      end
      @total_due = sum
    end
end
