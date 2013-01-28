class Sponsor::BaseController < ApplicationController
  before_filter :authenticate_sponsor_user!
  layout "sponsor"
end
