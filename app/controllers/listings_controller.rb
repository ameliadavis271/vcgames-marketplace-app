# frozen_string_literal: true

class ListingsController < ApplicationController
  before_action :set_listing, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new create edit destroy]

  # GET /listings
  def index
    #below displays all listings that haven't been sold and allows for a search call
    # refer to scope in model for search
    if params[:search].present? 
      @listings = Listing.where(nil)
      search_params.each do |key, value|
        @listings = @listings.public_send("search_by_#{key}", value).where(sold: nil)
      end
    else
      @listings = Listing.where(sold: nil)
    end
  end

  # GET /listings/1
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
        quantity: 1
      }],
      payment_intent_data: {
        metadata: {
          listing_id: @listing.id
        }
      },
      success_url: "#{root_url}payments/success?listing_id=#{@listing.id}",
      cancel_url: "#{root_url}listings"
    )
    @session_id = session.id
  end

# GET /listings/new
  def new
    @listing = Listing.new
  end

  # POST /listings
  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save
      # sends an email to user upon listing creation
      UserNotifierMailer.send_listing_new_mail(current_user, @listing).deliver
      redirect_to listings_path
    else
      render :new
    end
  end

  # GET /listings/1/edit
  def edit; end

  # PATCH/PUT /listings/1
  def update
    @listing.update(listing_params)
    redirect_to listings_path
  end

  # DELETE /listings/1
  def destroy
    @listing.destroy
    redirect_to listings_path
  end

  private

  # Only allow a list of trusted parameters through.
  def listing_params
    params.require(:listing).permit(:name, :description, :price, :sold, :console, :picture)
  end

  # sets parameter for search
  def search_params
    params.require(:search).permit(:name)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_listing
    @listing = Listing.find(params[:id])
  end
end
