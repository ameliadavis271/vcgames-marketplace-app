class ListingsController < ApplicationController

def index
  @listings = Listing.all
end

def show
end

def new
  @listing = Listing.new
end

def create
  @listing = Listing.new(listing_params)
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
  params.require(:listing).permit(:name, :description, :sold)
end

def set_params
end

end
