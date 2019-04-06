class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = current_user
    render :show
  end

  def index
    @users = User.all
    render :index
  end

  def destroy
    @user = current_user
    @user.destroy
    session[session_token] = nil
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
