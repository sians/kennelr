class ReviewsController < ApplicationController
  before_action :get_review, only: %i[edit update destroy]

  def index
    @reviews = policy_scope(Review).order(created_at: :desc)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  private

  def get_review
    @review = Review.find(params[:id])
    authorize @review
  end

  def booking_params
    params.require(:review).permit(:description, :rating, :booking_id)
  end

end
