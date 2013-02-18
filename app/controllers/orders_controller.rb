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
      respond_to do |format|
        format.js { render :nothing => true, :status => 200 }
      end
    else
      respond_to do |format|
        format.js { render :new, :layout => false, :status => :unprocessable_entity }
      end
    end
  end

  # thank you
  def show
    @order = Order.find(params[:id])
  end

end
