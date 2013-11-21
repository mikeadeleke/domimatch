class ListingsController < ApplicationController
  before_action :set_listing, only: [:edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /listings
  # GET /listings.json
  def index
    @listings = Listing.all
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    @listing = Listing.find(params[:id])
  end

  # GET /listings/new
  def new
    @listing = current_user.listings.new
  end

  # GET /listings/1/edit
  def edit
    if !@listing
      redirect_to listings_url
    end
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = current_user.listings.new(listing_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render action: 'show', status: :created, location: @listing }
      else
        format.html { render action: 'new' }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    if @listing
      @listing.destroy
      respond_to do |format|
        format.html { redirect_to listings_url }
        format.json { head :no_content }
      end
    else
      redirect_to listings_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = current_user.listings.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:address, :price, :number_of_roommates, :notes, :user_id, :image)
    end
end
