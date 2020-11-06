require 'rails_helper'

# CAPYBARA TESTING

RSpec.feature "on index page" do
  # will run this code before all tests in the wrapped feature
  before(:each) do 
    visit listings_path
  end
  scenario "user successfully navigates to /tweets" do
    # checks current path
    expect(page).to have_current_path(listings_path)
  end
  scenario "checks for css on page" do
    visit "/listings"
    # this will show the html for the page
    p page.html
    # these will check if the element checked is on the page
    expect(page).to have_css('.listings')
    expect(page).to have_css("h1", text: "Listings")
    # this will check if the element checked ISN'T on the page
    expect(page).to_not have_css("h1", text: "Products")
  end
  scenario "user can click on button to take them to a new page" do
    # checks for a clickable button that redirects to new page
    click_on "New Listing"
    expect(page).to have_current_path(new_listing_path)
  end
end
