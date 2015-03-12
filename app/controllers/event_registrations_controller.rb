class EventRegistrationsController < ApplicationController
  before_action :authenticate_user!

  # GET /event_registrations
  def index
    @event_registrations = EventRegistration.all
  end

  # GET /event_registrations/1
  def show
    @event_registration = EventRegistration.find(params[:id])
  end

  # GET /event_registrations/new
  def new
    @event_registration = EventRegistration.new

    @events = Event.all
    render :new, layout: false
  end

  # # GET /event_registrations/1/edit
  # def edit
  # end

  # POST /event_registrations
  def create
    @event_registration = EventRegistration.new(event_registration_params)

    @event_registration.token = SecureRandom.hex(3)
    @event_registration.amount = registration_total_fee()
    @event_registration.user = current_user
    p @user
    if @event_registration.save
      redirect_to @event_registration, notice: 'Event registration was successfully created.'
    else
      @events = Event.all
      render :new, layout: false
    end
  end

  # # PATCH/PUT /event_registrations/1
  # def update
  #   if @event_registration.update(event_registration_params)
  #     redirect_to @event_registration, notice: 'Event registration was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end

  # # DELETE /event_registrations/1
  # def destroy
  #   @event_registration.destroy
  #   redirect_to event_registrations_url, notice: 'Event registration was successfully destroyed.'
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def registration_total_fee
      if not params["events"]
        return 0
      end
      sum = 0
      params["events"].each do |event_code|
        sum += Event.where(name: event_code).first.registration_fee
      end

      return sum
    end

    # Only allow a trusted parameter "white list" through.
    def event_registration_params
      params.require(:event_registration).permit(:name, :mobile_no, :college, :events)
    end
end
