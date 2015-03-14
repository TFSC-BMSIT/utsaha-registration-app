class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_total_due, if: :user_signed_in?

  private

    def set_total_due
      @total_due = calculate_total_due(current_user)
    end

    def calculate_total_due(user)
      sum = 0
      EventRegistration.where(user: user).each do |r|
        sum += r.amount
      end

      return sum
    end
end
