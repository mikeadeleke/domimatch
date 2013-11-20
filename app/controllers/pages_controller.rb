class PagesController < ApplicationController
  def home
  	@listings = Listing.all
  	@requests = Request.all
  end
end
