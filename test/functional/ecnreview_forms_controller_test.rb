require 'test_helper'

class EcnreviewFormsControllerTest < ActionController::TestCase
  setup do
    @ecnreview_form = ecnreview_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ecnreview_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ecnreview_form" do
    assert_difference('EcnreviewForm.count') do
      post :create, :ecnreview_form => @ecnreview_form.attributes
    end

    assert_redirected_to ecnreview_form_path(assigns(:ecnreview_form))
  end

  test "should show ecnreview_form" do
    get :show, :id => @ecnreview_form.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ecnreview_form.to_param
    assert_response :success
  end

  test "should update ecnreview_form" do
    put :update, :id => @ecnreview_form.to_param, :ecnreview_form => @ecnreview_form.attributes
    assert_redirected_to ecnreview_form_path(assigns(:ecnreview_form))
  end

  test "should destroy ecnreview_form" do
    assert_difference('EcnreviewForm.count', -1) do
      delete :destroy, :id => @ecnreview_form.to_param
    end

    assert_redirected_to ecnreview_forms_path
  end
end
