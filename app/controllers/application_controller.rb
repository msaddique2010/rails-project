class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "Access denied: You are not authorized to perform this action."
    redirect_to(request.referer || root_path)
  end
end
