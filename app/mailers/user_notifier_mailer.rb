class UserNotifierMailer < ApplicationMailer
default from: 'ameliadavis271@gmail.com'

  def send_signup_email(user)
    mail( to: @user.email,subject: 'Thanks for signing up for our amazing app' )
  end

  def send_listing_new_mail(user, listing)
    @user = user
    mail( to: @user.email, subject: 'Thanks for creating a new listing!' )
  end

end
