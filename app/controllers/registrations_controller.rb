class RegistrationsController < Devise::RegistrationsController
  before_action :fetch_user, only: %i[update]

  def update
    if @user.update(user_params)
      redirect_to profile_path
    else
      render 'edit'
    end
  end

  private

  def fetch_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:avatar, :avatar_cache)
  end

end
