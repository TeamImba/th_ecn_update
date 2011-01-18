require 'test_helper'

class EcndocumentsControllerTest < ActionController::TestCase
  setup do
    @ecndocument = ecndocuments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ecndocuments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ecndocument" do
    assert_difference('Ecndocument.count') do
      post :create, :ecndocument => @ecndocument.attributes
    end

    assert_redirected_to ecndocument_path(assigns(:ecndocument))
  end

  test "should show ecndocument" do
    get :show, :id => @ecndocument.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ecndocument.to_param
    assert_response :success
  end

  test "should update ecndocument" do
    put :update, :id => @ecndocument.to_param, :ecndocument => @ecndocument.attributes
    assert_redirected_to ecndocument_path(assigns(:ecndocument))
  end

  test "should destroy ecndocument" do
    assert_difference('Ecndocument.count', -1) do
      delete :destroy, :id => @ecndocument.to_param
    end

    assert_redirected_to ecndocuments_path
  end
end
