class EventRegistrationsController < ApplicationController
  before_action :set_event_registration, only: [:show, :edit, :update, :destroy]

  # GET /event_registrations
  def index
    @event_registrations = EventRegistration.all
  end

  # GET /event_registrations/1
  def show
  end

  # GET /event_registrations/new
  def new
    @event_registration = EventRegistration.new
  end

  # GET /event_registrations/1/edit
  def edit
  end

  # POST /event_registrations
  def create
    @event_registration = EventRegistration.new(event_registration_params)

    if @event_registration.save
      redirect_to @event_registration, notice: 'Event registration was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /event_registrations/1
  def update
    if @event_registration.update(event_registration_params)
      redirect_to @event_registration, notice: 'Event registration was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /event_registrations/1
  def destroy
    @event_registration.destroy
    redirect_to event_registrations_url, notice: 'Event registration was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_registration
      @event_registration = EventRegistration.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_registration_params
      params.require(:event_registration).permit(:name, :mobile_no, :college, :token, :amount, :user_id)
    end
end
