class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from Exception, with: :error500
  rescue_from ActiveRecord::RecordNotFound, ActionController::RoutingError, with: :error404

  helper_method :login?, :current_user

  def error404
    render 'error404', status: 404, formats: [:html]
  end

  def error500
    render 'error500', status: 500, formats: [:html]
  end

  private

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def login?
    session[:user_id].present?
  end

  def authenticate
    return if logged_in?
    redirect_to root_path, alert: 'ログインしてください'
  end

end
