class Users::RegistrationsController < Devise::RegistrationsController
  def create
    # flash.delete :recaptcha_error
    # if !verify_recaptcha
    #   build_resource(sign_up_params)
    #   resource.valid?
    #   resource.errors.add(:base, "There was an error with the recaptcha code below. Please re-enter the code.")
    #   clean_up_passwords(resource)
    #   respond_with_navigational(resource) { render_with_scope :new }
    # else
    #   @user = build_resource # Needed for Merit
    #   super
    # end
    @user = User.new(params[:user].permit(:name))
    recaptcha_valid = verify_recaptcha(model: @user, action: 'registration')
    if recaptcha_valid
      if @user.save
        redirect_to @user
      else
        render 'new'
      end
    else
      # Score is below threshold, so user may be a bot. Show a challenge, require multi-factor
      # authentication, or do something else.
      render 'new'
    end
  end

  def update
    @user = resource # Needed for Merit
    super
  end
end
