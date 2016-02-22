class PropertyRentalRequestsController < ApplicationController
  before_action :set_property_rental_request, only: [:show, :edit, :update, :destroy]

  # GET /property_rental_requests
  # GET /property_rental_requests.json
  def index
    @property_rental_requests = PropertyRentalRequest.all
  end

  # GET /property_rental_requests/1
  # GET /property_rental_requests/1.json
  def show
  end

  # GET /property_rental_requests/new
  def new
    @property_rental_request = current_user.property_rental_requests.build
  end

  # GET /property_rental_requests/1/edit
  def edit
  end

  # POST /property_rental_requests
  # POST /property_rental_requests.json
  def create
    @property_rental_request = current_user.property_rental_requests.build(property_rental_request_params)

    respond_to do |format|
      if @property_rental_request.save
        format.html { redirect_to @property_rental_request, notice: 'Property rental request was successfully created.' }
        format.json { render :show, status: :created, location: @property_rental_request }
      else
        format.html { render :new }
        format.json { render json: @property_rental_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /property_rental_requests/1
  # PATCH/PUT /property_rental_requests/1.json
  def update
    respond_to do |format|
      if @property_rental_request.update(property_rental_request_params)
        format.html { redirect_to @property_rental_request, notice: 'Property rental request was successfully updated.' }
        format.json { render :show, status: :ok, location: @property_rental_request }
      else
        format.html { render :edit }
        format.json { render json: @property_rental_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /property_rental_requests/1
  # DELETE /property_rental_requests/1.json
  def destroy
    @property_rental_request.destroy
    respond_to do |format|
      format.html { redirect_to property_rental_requests_url, notice: 'Property rental request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property_rental_request
      @property_rental_request = PropertyRentalRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_rental_request_params
      params.fetch(:property_rental_request, {})
    end
end
