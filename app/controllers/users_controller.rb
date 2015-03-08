class UsersController < ApplicationController
  # before_action :authenticate_user_from_token!

  def show
    @user = current_user
    render json: { :user => @user.as_json(:only => [:id, :email, :full_name, :age, :experience, :skills, :education]) }, status: :ok
  end

  def edit
    @user = current_user
    if @user.update( user_profile_params )
      render json: { :user => @user.as_json(:only => [:email, :full_name, :age, :experience, :skills, :education])}, status: :accepted
    else
      render json: { :error => "Could not edit user."}, status: :bad_request
    end
  end

  private

    def user_profile_params
      params.require(:user).permit(:full_name, :age, :experience, :skills, :education)
    end
end
