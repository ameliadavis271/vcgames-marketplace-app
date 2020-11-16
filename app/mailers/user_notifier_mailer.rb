# frozen_string_literal: true

class UserNotifierMailer < ApplicationMailer
  default from: 'ameliadavis271@gmail.com'

  def send_signup_email(_user)
    mail(to: @user.email, subject: 'Thanks for signing up for our amazing app')
  end

  def send_listing_new_mail(user, listing)
    @user = user
    @listing = listing
    mail(to: @user.email, subject: 'Thanks for creating a new listing!')
  end
end
