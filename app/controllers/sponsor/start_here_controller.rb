class Sponsor::StartHereController < Sponsor::BaseController
  def index
    @sponsor = current_user.sponsor
  end
  
  def send_request
    validate_params "name", "email" 
    SponsorMailer.request_admin(current_user, params[:name], params[:email]).deliver if @errors.blank?
    respond_to :js
  end
  
end
