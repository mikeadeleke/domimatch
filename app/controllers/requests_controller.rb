class RequestsController < ApplicationController
  before_action :set_request, only: [:edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
    @request = Request.find(params[:id])
  end

  # GET /requests/new
  def new
    @request = current_user.requests.new
  end

  # GET /requests/1/edit
  def edit
    if !@request
      redirect_to requests_url
    end
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = current_user.requests.new(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'request was successfully created.' }
        format.json { render action: 'show', status: :created, location: @request }
      else
        format.html { render action: 'new' }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    if @request
      @request.destroy
      respond_to do |format|
        format.html { redirect_to requests_url }
        format.json { head :no_content }
      end
    else
      redirect_to requests_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = current_user.requests.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:price_range, :type_of_house, :term)
    end
end

