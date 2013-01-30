class Sponsor::BaseController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_sponsor_admin!
  protect_from_forgery
  layout "sponsor"
  
  def validate_params(*args)
    @errors ||= []
    args.each { |name|
      @errors << "#{name} can't be blank" if params[name].blank?
    }
  end 
  
  protected
    def require_sponsor_admin!
      unless(current_user.is_sponsor)
        redirect_to root_path, :notice => 'you must be an sponsor admin to access this area'
      end
    end
end
