require 'test_helper'

class DudadsControllerTest < ActionController::TestCase
  setup do
    @dudad = dudads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dudads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dudad" do
    assert_difference('Dudad.count') do
      post :create, dudad: @dudad.attributes
    end

    assert_redirected_to dudad_path(assigns(:dudad))
  end

  test "should show dudad" do
    get :show, id: @dudad.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dudad.to_param
    assert_response :success
  end

  test "should update dudad" do
    put :update, id: @dudad.to_param, dudad: @dudad.attributes
    assert_redirected_to dudad_path(assigns(:dudad))
  end

  test "should destroy dudad" do
    assert_difference('Dudad.count', -1) do
      delete :destroy, id: @dudad.to_param
    end

    assert_redirected_to dudads_path
  end
end
