class EventRegistrationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recent_registrations, only: [:new, :create]

  # GET /event_registrations
  def index
    @event_registrations = EventRegistration.order('created_at DESC')
  end

  # GET /event_registrations/1
  def show
    @event_registration = EventRegistration.find(params[:id])
  end

  # GET /event_registrations/new
  def new
    @event_registration = EventRegistration.new

    @events = Event.all
    render :new
  end

  # POST /event_registrations
  def create
    @event_registration = EventRegistration.new(event_registration_params)

    @event_registration.token = loop do
      t = SecureRandom.hex(3)
      break t unless EventRegistration.exists?(token: t)
    end

    @event_registration.amount = registration_total_fee()
    @event_registration.user = current_user
    @event_registration.events = registered_events()

    if @event_registration.save
      SMSSender.send_sms(
        @event_registration.mobile_no,
        sms_message
      )

      redirect_to @event_registration, notice: 'Event registration was successfully created.'
    else
      @events = Event.all
      render :new
    end
  end

  def stats
    @user_dues = []
    @total_collected = 0
    User.find_each do |u|
      due = calculate_total_due(u)
      @user_dues << {name: u.name, due: due}
      @total_collected += due
    end
    @user_dues = @user_dues.sort_by { |u| u[:due]}.reverse
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def registration_total_fee
      if not params["events"]
        return 0
      end
      sum = 0
      params["events"].each do |event_code|
        next if event_code == "None"
        sum += Event.where(name: event_code).first.registration_fee
      end

      return sum
    end

    def registered_events
      if not params["events"]
        return []
      end
      events = []
      params["events"].each do |event_code|
        next if event_code == "None"
        events << Event.where(name: event_code).first
      end

      return events
    end

    def sms_message
      events = @event_registration.events.map(&:name).join(', ')
      m = "Dear #{@event_registration.name}, your registration of Rs. #{@event_registration.amount} for #{events} at Utsaha 2015 has been confirmed. UniqueToken: #{@event_registration.token}. Please keep this token safely."

      if @event_registration.events.any? { |e| e.name.include? "tshirt" }
        m << "Collect T-Shirts on 18th Noon at the Main Block."
      end

      return m
    end

    # Only allow a trusted parameter "white list" through.
    def event_registration_params
      params.require(:event_registration).permit(:name, :mobile_no, :college, :events)
    end

    def set_recent_registrations
      @recent_registrations = EventRegistration.order(id: :desc).limit(5)
    end
end
