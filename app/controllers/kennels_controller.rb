class KennelsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :get_kennel, only: %i[show create edit update destroy]
  def index
    if params[:query]
      @kennels = policy_scope(Kennel.geocoded).near(params[:query], 50)
      if @kennels.empty?
        @success = false
        @kennels = policy_scope(Kennel.geocoded).order(created_at: :desc)
      else
        @success = true
      end
    else
      @kennels = policy_scope(Kennel.geocoded).order(created_at: :desc)
    end
    @markers = @kennels.map do |kennel|
      {
        lat: kennel.latitude,
        lng: kennel.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { kennel: kennel })
      }
    end
  end

  def show
    @booking = Booking.new
    @markers = [{
      lat: @kennel.latitude,
      lng: @kennel.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { kennel: @kennel })
    }]
  end

  def new
    @kennel = Kennel.new
    authorize @kennel
  end

  def create
  end

  def edit
  end

  def update
    if @kennel.update(kennel_params)
      redirect_to profile_path
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def get_kennel
    @kennel = Kennel.find(params[:id])
    authorize @kennel
  end

  def kennel_params
    params.require(:kennel).permit(
      :name,
      :address,
      :capacity,
      :description,
      :total_rating,
      :day_care,
      :dog_walking,
      :behaviorist,
      :daily_price,
      :user_id
      )
  end
end
