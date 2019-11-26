class KennelPhotosController < ApplicationController
  before_action :get_kennel_photo, only: %i[show edit update destroy]
  before_action :get_kennel, only: %i[index new create]

  def index
    @kennel_photos = policy_scope(KennelPhoto).order(created_at: :desc)
  end

  def new
    @kennel_photo = KennelPhoto.new(kennel: @kennel)
    authorize @kennel_photo
  end

  def create
    @kennel_photo = KennelPhoto.new(kennel_photo_params)
    @kennel_photo.user = current_user
    @kennel_photo.kennel = @kennel
    authorize @kennel_photo
    if @kennel_photo.save
      redirect_to new_kennel_kennel_photo_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def get_kennel_photo
    @kennel_photo = KennelPhoto.find(params[:id])
    authorize @kennel_photo
  end

  def get_kennel
    @kennel = Kennel.find(params[:kennel_id])
  end

  def kennel_photo_params
    params.require(:kennel_photo).permit(
      :photo,
      :kennel_id,
      :user_id
      )
  end
end
