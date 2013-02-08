class MemberTypesController < ApplicationController
  def index
    @member_types = MemberType.order("price_in_cents ASC")
  end
end
