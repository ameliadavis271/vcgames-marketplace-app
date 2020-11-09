class ListingsController < ApplicationController
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
end

def update
end

def destroy
end

private

def listing_params
  params.require(:listing).permit(:name, :description, :price, :sold)
end

def search_params
  params.require(:search).permit(:name)
end

def set_params
end

end
