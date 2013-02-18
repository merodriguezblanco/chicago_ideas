class OrderMailer < ActionMailer::Base
  default :from    => 'forms@chicagoideas.com'
  default :subject => "Thank you for joining CIW's Member Program"

  def thank_you_membership(order)
    @order = order
    mail(:to => order.email)
  end
end
