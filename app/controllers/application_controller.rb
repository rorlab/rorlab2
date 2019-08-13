class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  add_flash_types :info, :error
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
