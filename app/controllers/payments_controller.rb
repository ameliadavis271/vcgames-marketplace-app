class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def success
    # move to webhook once changed, in event where payment successfully goes through
    listing = Listing.find(params[:listing_id])
    payment = current_user.payments.create(listing_id: listing)
    listing.sold = true
    listing.save
  end

  def cancel
    
  end
end
