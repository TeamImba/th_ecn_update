require 'test_helper'

class EcnpositionsControllerTest < ActionController::TestCase
  setup do
    @ecnposition = ecnpositions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ecnpositions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ecnposition" do
    assert_difference('Ecnposition.count') do
      post :create, :ecnposition => @ecnposition.attributes
    end

    assert_redirected_to ecnposition_path(assigns(:ecnposition))
  end

  test "should show ecnposition" do
    get :show, :id => @ecnposition.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ecnposition.to_param
    assert_response :success
  end

  test "should update ecnposition" do
    put :update, :id => @ecnposition.to_param, :ecnposition => @ecnposition.attributes
    assert_redirected_to ecnposition_path(assigns(:ecnposition))
  end

  test "should destroy ecnposition" do
    assert_difference('Ecnposition.count', -1) do
      delete :destroy, :id => @ecnposition.to_param
    end

    assert_redirected_to ecnpositions_path
  end
end
