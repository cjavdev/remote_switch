module Authable
  extend ActiveSupport::Concern

  included do
    helper_method :current_user, :signed_in?
  end

  def signed_in?
    !!current_user
  end

  def current_user
    @_current_user ||= User.find_by(session_token: session[:token])
  end

  def sign_in!(user)
    session[:token] = user.reset_session_token!
  end

  def sign_out!
    user.reset_session_token!
    session[:token] = nil
  end

  def require_user!
    redirect_to new_session_url unless signed_in?
  end
end
