class OrdersController < ApplicationController

  def new
    @order = Order.new
    @order.member_type = MemberType.find(params[:member_id])
  end

  def create
    @order = Order.new(params[:order])
    @order.member_type = MemberType.find(params[:order][:member_type_id])

    if @order.process_transaction
      OrderMailer.thank_you_membership(@order).deliver
      redirect_to thank_you_path(@order.to_param), :notice => "Purchase confirmed"
    else
      render :new
    end
  end

  # thank you
  def show
    @order = Order.find(params[:id])
  end

end
