class Sponsor::StartHereController < Sponsor::BaseController
  def index
    @sponsor = current_user.sponsor
  end
  
  def send_request
    validate_params "name", "email"
    unless User.where(email: params[:email]).blank?
      @errors << "Already a user of CIW"
    end
    if @errors.blank?
      password = Devise.friendly_token[0,8]
      user = User.new(name: params[:name], email: params[:email])
      user.is_sponsor = true
      user.sponsor = current_user.sponsor
      user.password = password
      user.is_admin_created = true
      user.save
      @errors += user.errors.full_messages unless user.errors.blank?
    end
    url = "http://#{request.host_with_port}/sponsor"
    SponsorMailer.invite_sponsor(current_user, params[:email], password, url).deliver if @errors.blank?
    respond_to :js
  end
  
  def update_sponsor
    @sponsor = current_user.sponsor
    do_unlock = false
    if @sponsor.logo_file_name.blank? || @sponsor.eps_logo_file_name.blank? || @sponsor.sponsor_agreement_file_name.blank?
      do_unlock = true if @sponsor.locked?
    end
    if @sponsor.update_attributes(params[:sponsor])
      update_primary_contact
      unlock if do_unlock
      redirect_to sponsor_root_path, notice: "Sponsor was saved successfully"
    else
      @errors = @sponsor.errors.full_messages
      render :index
    end
  end
  
  private 
    def update_primary_contact
      user = User.find params[:primary_contact] if params[:primary_contact]
      if user
        user.sponsor_user.update_attribute(:primary_contact, true)
      end
    end
  
    def unlock
      unless (@sponsor.logo_file_name.blank? || @sponsor.eps_logo_file_name.blank? || @sponsor.sponsor_agreement_file_name.blank?)
        @sponsor.locked = false
        @sponsor.save
      end
    end
end
