require 'test_helper'

class PropertyRentalRequestsControllerTest < ActionController::TestCase
  setup do
    @property_rental_request = property_rental_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:property_rental_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create property_rental_request" do
    assert_difference('PropertyRentalRequest.count') do
      post :create, property_rental_request: {  }
    end

    assert_redirected_to property_rental_request_path(assigns(:property_rental_request))
  end

  test "should show property_rental_request" do
    get :show, id: @property_rental_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @property_rental_request
    assert_response :success
  end

  test "should update property_rental_request" do
    patch :update, id: @property_rental_request, property_rental_request: {  }
    assert_redirected_to property_rental_request_path(assigns(:property_rental_request))
  end

  test "should destroy property_rental_request" do
    assert_difference('PropertyRentalRequest.count', -1) do
      delete :destroy, id: @property_rental_request
    end

    assert_redirected_to property_rental_requests_path
  end
end
