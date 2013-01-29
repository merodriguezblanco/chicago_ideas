class Sponsor::BaseController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_sponsor_admin!
  layout "sponsor"
  
  protected
    def require_sponsor_admin!
      unless(current_user.admin || current_user.is_sponsor)
        redirect_to root_path, :notice => 'you must be an sponsor admin to access this area'
      end
    end
end
