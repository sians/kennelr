class DogsController < ApplicationController
  before_action :get_dog, only: %i[show edit update destroy]
  def index
    @dogs = policy_scope(Dog).order(created_at: :desc)
  end

  def show
  end

  def new
    @dog = Dog.new
    authorize @dog
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    authorize @dog
    if @dog.save
      redirect_to profile_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @dog.update(dog_params)
      redirect_to profile_path
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def get_dog
    @dog = Dog.find(params[:id])
    authorize @dog
  end

  def dog_params
    params.require(:dog).permit(:name, :age, :breed, :dietry_requirements, :medications, :user_id, :vet_id, :picture)
  end
end
