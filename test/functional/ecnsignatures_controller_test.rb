require 'test_helper'

class EcnsignaturesControllerTest < ActionController::TestCase
  setup do
    @ecnsignature = ecnsignatures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ecnsignatures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ecnsignature" do
    assert_difference('Ecnsignature.count') do
      post :create, :ecnsignature => @ecnsignature.attributes
    end

    assert_redirected_to ecnsignature_path(assigns(:ecnsignature))
  end

  test "should show ecnsignature" do
    get :show, :id => @ecnsignature.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ecnsignature.to_param
    assert_response :success
  end

  test "should update ecnsignature" do
    put :update, :id => @ecnsignature.to_param, :ecnsignature => @ecnsignature.attributes
    assert_redirected_to ecnsignature_path(assigns(:ecnsignature))
  end

  test "should destroy ecnsignature" do
    assert_difference('Ecnsignature.count', -1) do
      delete :destroy, :id => @ecnsignature.to_param
    end

    assert_redirected_to ecnsignatures_path
  end
end
