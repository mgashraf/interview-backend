class UsersController < ApplicationController
  # before_action :authenticate_user_from_token!

  def show
    @user = User.find(params[:id])
    render json: {:user => @user.as_json(:only => [:email, :id])}, status: :ok
  end
end
