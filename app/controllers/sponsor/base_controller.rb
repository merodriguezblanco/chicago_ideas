class Sponsor::BaseController < ApplicationController
  skip_before_filter :cache_rendered_page
  before_filter :authenticate_user!
  before_filter :require_sponsor_admin!
  before_filter :init

  protect_from_forgery
  layout "sponsor"

  def validate_params(*args)
    @errors ||= []
    args.each { |name|
      @errors << "#{name} can't be blank" if params[name].blank?
    }
  end

=begin
  ## method to check email uniqueness for any model. Need to optimize and write tests.
  def validate_email_uniqueness(email, model_name)
    @errors ||= []
    @errors << "Already a user of CIW" if email && model_name.camelize.constantize.where(email => params[email]).exists?
  end
=end

  def init
    @sponsor = current_user.sponsor
  end

  protected
  def require_sponsor_admin!
    unless(current_user.is_sponsor)
      redirect_to root_path, :notice => 'you must be an sponsor admin to access this area'
    end
  end
end
