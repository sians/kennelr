class BookingsController < ApplicationController
  before_action :get_booking, only: %i[show edit update destroy]

  def index
    @bookings = policy_scope(Booking).where(user: current_user).order(created_at: :desc)
    @kennels = @bookings.map do |booking|
      booking.kennel
    end
  end

  def show
  end

  def new
    @booking = Booking.new
    @kennel = Kennel.find(params[:kennel_id])
    authorize @booking
  end

  def create
    dog_ids = params[:hidden_dog_list].split(",")
    save_checks = false
    dog_ids.each do |dog_id|
      @booking = Booking.new(booking_params)
      @booking.dog = Dog.find(dog_id)
      @booking.kennel = Kennel.find(params[:kennel_id])
      @booking.user = current_user
      @booking.active = true
      @booking.save ? save_checks = true : save_checks = false
    end
    if save_checks
      redirect_to profile_path
    else
      @kennel = Kennel.find(params[:kennel_id])
      render kennel_path(@kennel)
    end
      authorize @booking
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def get_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
