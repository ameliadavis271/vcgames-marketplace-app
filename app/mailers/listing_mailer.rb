class ListingMailer < ApplicationMailer

  def send_listing_new_mail(user)
    @user = user
    mail( to: @user.email, subject: 'Thanks for signing up for our amazing app' )
  end

end
