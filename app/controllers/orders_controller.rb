class OrdersController < ApplicationController

  def new
    @order = Order.new
    @order.member_type = MemberType.find(params[:member_id])
  end

  def create
    @order = Order.new(params[:order])
    @order.member_type = MemberType.find(params[:order][:member_type_id])

    if @order.process_transaction
      redirect_to '/', :notice => "member!"
    else
      render :new
    end
  end

end
