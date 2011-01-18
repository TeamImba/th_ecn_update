require 'test_helper'

class EcnusersControllerTest < ActionController::TestCase
  setup do
    @ecnuser = ecnusers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ecnusers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ecnuser" do
    assert_difference('Ecnuser.count') do
      post :create, :ecnuser => @ecnuser.attributes
    end

    assert_redirected_to ecnuser_path(assigns(:ecnuser))
  end

  test "should show ecnuser" do
    get :show, :id => @ecnuser.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ecnuser.to_param
    assert_response :success
  end

  test "should update ecnuser" do
    put :update, :id => @ecnuser.to_param, :ecnuser => @ecnuser.attributes
    assert_redirected_to ecnuser_path(assigns(:ecnuser))
  end

  test "should destroy ecnuser" do
    assert_difference('Ecnuser.count', -1) do
      delete :destroy, :id => @ecnuser.to_param
    end

    assert_redirected_to ecnusers_path
  end
end
