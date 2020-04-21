class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # this line protects applications against CSRF, Cross-Site Request Forgery

  include SessionsHelper
  
end
