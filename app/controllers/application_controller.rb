class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    if user_signed_in?
      redirect_to root_url, :alert => t('cancan.access_denied')
    else
      redirect_to new_user_session_url, :alert => t('cancan.access_denied')
    end
  end
end
