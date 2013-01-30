class SponsorMailer < ActionMailer::Base

  default :from => "forms@chicagoideas.com"
  default :to => "leah@chicagoideas.com"
    
  def request_admin(user, name, email)
    @user = user
    @name = name
    @email = email
    mail(subject: "New Sponsor Admin request")
  end

end
