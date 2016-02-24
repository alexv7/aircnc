require 'test_helper'

class RentalRequestsControllerTest < ActionController::TestCase
  setup do
    @rental_request = rental_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rental_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rental_request" do
    assert_difference('RentalRequest.count') do
      post :create, rental_request: {  }
    end

    assert_redirected_to rental_request_path(assigns(:rental_request))
  end

  test "should show rental_request" do
    get :show, id: @rental_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rental_request
    assert_response :success
  end

  test "should update rental_request" do
    patch :update, id: @rental_request, rental_request: {  }
    assert_redirected_to rental_request_path(assigns(:rental_request))
  end

  test "should destroy rental_request" do
    assert_difference('RentalRequest.count', -1) do
      delete :destroy, id: @rental_request
    end

    assert_redirected_to rental_requests_path
  end
end
