ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :user_name            => 'mytest1221@gmail.com',
  :password             => '1234qwerQ',
  :authentication       => 'plain',
  :enable_starttls_auto => true
}

ActionMailer::Base.delivery_method = :smtp
