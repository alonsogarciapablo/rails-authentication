class PasswordsController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(password_params)
      redirect_to edit_password_path, notice: "Your password was updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  private

  def password_params
    params.require(:user).permit(
      :password,
      :password_confirmation,
      :password_challenge
    )
  end
end
