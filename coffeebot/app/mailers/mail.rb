class MailMailer < ActionMailer::Base

  def new_notification(email_list,status,summary,email_body)
    recipients 'andy.lee@onlive.com'
    bcc        email_list
    from       "coffeebot@raspberrypi"
    subject    "#{status.upcase}: #{summary}"
    body       :email_body => email_body
  end

  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/login'
    mail(to: @user.email, subject: 'Thanks for subscribing to CoffeeBot!')
  end

end

