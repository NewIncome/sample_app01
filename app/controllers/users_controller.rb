class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "New user created successfully!"
      redirect_to @user
    else
      render 'new'
    end
  end

  # Decided not to create a sessions controller and work the session through here.
  def login
    # @user = User.find_by(email: params[:user][:email])
    # if @user && @user.authenticate(params[:user][:password])
    #   render html: 'It worked!'
    # else
    #   render html: "It didn't work :("
    # end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
