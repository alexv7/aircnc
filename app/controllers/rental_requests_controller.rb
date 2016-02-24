class RentalRequestsController < ApplicationController
  before_action :set_rental_request, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_property, only: [:new, :create, :index]


  # GET /rental_requests
  # GET /rental_requests.json
  def index
    @rental_requests = RentalRequest.all
  end

  # GET /rental_requests/1
  # GET /rental_requests/1.json
  def show
  end

  def approve
   @rental_request = RentalRequest.find(params[:id])
   @rental_request.approve!

   redirect_to property_rental_requests_path(Property.find(@rental_request.property_id)), notice: 'Rental request was Approved.'
  end

  def deny
   @rental_request = RentalRequest.find(params[:id])
   @rental_request.deny!

   redirect_to property_rental_requests_path(Property.find(@rental_request.property_id)), notice: 'Rental request was Denied.'
  end

  # GET /rental_requests/new
  def new
    @rental_request = RentalRequest.new
  end

  # GET /rental_requests/1/edit
  def edit
  end



  # POST /rental_requests
  # POST /rental_requests.json
  def create
    @rental_request = @property.rental_requests.new(rental_request_params)
    @rental_request.user = current_user
    respond_to do |format|
      if @rental_request.save
        format.html { redirect_to @rental_request, notice: 'Rental request was successfully created.' }
        format.json { render :show, status: :created, location: @rental_request }
      else
        format.html { render :new }
        format.json { render json: @rental_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rental_requests/1
  # PATCH/PUT /rental_requests/1.json
  def update
    respond_to do |format|
      if @rental_request.update(rental_request_params)
        format.html { redirect_to @rental_request, notice: 'Rental request was successfully updated.' }
        format.json { render :show, status: :ok, location: @rental_request }
      else
        format.html { render :edit }
        format.json { render json: @rental_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rental_requests/1
  # DELETE /rental_requests/1.json
  def destroy
    @rental_request.destroy
    respond_to do |format|
      format.html { redirect_to rental_requests_url, notice: 'Rental request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental_request
      @rental_request = RentalRequest.find(params[:id])
    end

    def set_property
      @property = Property.find(params[:property_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rental_request_params
      params.require(:rental_request).permit(:start_date, :end_date)
    end
end



#
#
#
# class CatRentalRequestsController < ApplicationController
#
#
#   def approve
#     @request = CatRentalRequest.find(params[:id])
#     if cats_owner
#       @request.approve!
#     end
#     redirect_to cats_url
#   end
#
#   def deny
#     @request = CatRentalRequest.find(params[:id])
#     if cats_owner
#       @request.deny!
#     end
#     redirect_to cat_url(@request.cat)
#   end
#
#   def index
#     render json: CatRentalRequest.all
#   end
#
#   def show
#     @request = CatRentalRequest.find(params[:id])
#     redirect_to cat_url(@request.cat_id)
#   end
#
#   def new
#     @request = CatRentalRequest.new
#     @cats = Cat.all
#     render :new
#   end
#
#   def create
#     params[:cat_rental_request][:user_id] = current_user.id
#     @request = CatRentalRequest.new(request_params)
#
#     if @request.save
#       redirect_to cat_rental_request_url(@request)
#     else
#       render json: @request.errors
#     end
#   end
#
#   private
#   def request_params
#     params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date, :user_id)
#   end
#
#   def cats_owner
#     current_user.id == @request.cat.user_id
#   end
# end
