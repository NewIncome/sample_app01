class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = "#{user.name}, you are logged in correctly"
      redirect_to user
    else
      flash.now[:danger] = "Email doesn't exist or password is incorrect."
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end