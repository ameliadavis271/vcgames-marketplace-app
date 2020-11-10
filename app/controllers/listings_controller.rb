class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :destroy]  
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
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save
      redirect_to listings_path
    else 
      render :new
    end
  end

  def edit
    set_listing
  end

  def update
    @listing = current_user.listings.update(listing_params)
    redirect_to listings_path
  end

  def destroy
    @listing.destroy
    redirect_to listings_path
  end

  private

  def listing_params
    params.require(:listing).permit(:name, :description, :price, :sold, :picture)
  end

  def search_params
    params.require(:search).permit(:name)
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end

end
