class ApplicationController < ActionController::Base
  include Pundit
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  # rescue_from CanCan::AccessDenied do |exception|
  #   flash[:alert] = "Access denied: You are not authorized to perform this action."
  #   redirect_to(request.referer || root_path)
  # end
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private
  def user_not_authorized
    flash[:alert] = "You'r not Authorized"
    redirect_to(request.referrer || root_path)
  end
end
