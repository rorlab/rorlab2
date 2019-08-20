class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super

  end

  def update
    @user = resource # Needed for Merit
    super
  end
end
