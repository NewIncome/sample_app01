module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end
  
  def logged_in?
    session[:user_id].nil? ? false : true
  end

  # The following (4) methods are needed to be able to manipulate
  # a permament session with a permanent cookie via a the remember_digest
  # new column in the Users table.

  # 1)Make the permanent cookies(id & r_tkn) and call the user.remember(make r_tkn & r_dig)
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # 2)Make a current_user based on if there's someone logged_in. Check in the session & cookies
  def current_user
    if (user_id = session[:user_id]) # is the same as doing the assignment before the IF
      @current_user ||= User.find_by(id: user_id) # if there is a @current_user return that, else = User.fin..
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  # 3)Make a forget(user) method to reset the rem_dig and delete the perm cookies
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # 4)Make the log_out also call the forget(user) and reset the @current_user
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil 
  end

end