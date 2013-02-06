class SponsorMailer < ActionMailer::Base

  default :from => "forms@chicagoideas.com"
  default :to => "leah@chicagoideas.com"
    
  def invite_sponsor(user, email, password, url)
    @user = user
    @password = password
    @email = email
    @url = url
    mail(to: email, subject: "Invite mail from ChicagoIdeas")
  end

end
