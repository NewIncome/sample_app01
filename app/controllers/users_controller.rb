class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "New user created successfully!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'Profile successfuly updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # The following methods are needed to REQUIRE that only the correct logged_in
  # user is the one to do certain actions, and if not, do not view those pages
  # and be sent to another link/page/action. And are private so no-one can manipulate
  # them.
  
  # To check if it is a logged_in_user before accessing index, edit, update & destroy
  def logged_in_user
    unless logged_in?   # if not logged_in be sent to login_url with a flash msg.
      flash[:danger] = "Please log in to have access."
      redirect_to login_url
    end
  end

  # M.to restrict info_update availability to only that logged_in user's info.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(@user) unless @user == current_user
  end

end
