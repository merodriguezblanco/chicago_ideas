class SessionsController < Devise::SessionsController

  def destroy
    if current_simulate_user
      sign_out(current_user)
      sign_in(:user, current_simulate_user.user, :bypass => true)
      sign_out(current_simulate_user)
    end
    super
  end
end
