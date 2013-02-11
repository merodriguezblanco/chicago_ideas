class OrdersController < ApplicationController

  def new
    @order = Order.new
    @order.member_type = MemberType.find(params[:member_id])
  end

end
