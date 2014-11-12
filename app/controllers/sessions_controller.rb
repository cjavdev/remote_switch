class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.with_credentials(user_params)
    if @user
      sign_in!(@user)
      redirect_to root_url
    else
      @user = User.new
      flash.now[:errors] = ['Invalid email and/or password']
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
