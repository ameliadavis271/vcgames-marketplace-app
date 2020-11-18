# frozen_string_literal: true

class UserNotifierMailer < ApplicationMailer
  # emails to users come from the below email
  default from: 'ameliadavis271@gmail.com'

  # method to allow for an email to be sent to user upon creatinf a new listing
  def send_listing_new_mail(user, listing)
    @user = user
    @listing = listing
    mail(to: @user.email, subject: 'Thanks for creating a new listing!')
  end
end
