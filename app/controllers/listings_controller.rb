class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]  
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]

  def index
    if params[:search].present?
      @listings = Listing.where(nil)
      search_params.each do |key, value|
        @listings = @listings.public_send("search_by_#{key}", value)
      end
    else
      @listings = Listing.all
    end
  end

  def show
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: [{
        name: @listing.name,
        description: @listing.description,
        # picture: @listing.picture,
        amount: (@listing.price * 100).to_i,
        currency: 'aud',
        quantity: 1,
      }],
      payment_intent_data: {
        metadata: {
          listing_id: @listing.id
        }
      },
      success_url: "#{root_url}payments/success?listingId=#{@listing.id}",
      cancel_url: "#{root_url}listings"
    )
    @session_id = session.id
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save
      UserNotifierMailer.send_listing_new_mail(current_user).deliver
      redirect_to listings_path
    else 
      render :new
    end
  end

  def edit
  end

  def update
    @listing.update(listing_params)
    redirect_to listings_path
  end

  def destroy
    @listing.destroy
    redirect_to listings_path
  end

  private

  def listing_params
    params.require(:listing).permit(:name, :description, :price, :sold, :brand, :console, :picture)
  end

  def search_params
    params.require(:search).permit(:name)
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end

end
