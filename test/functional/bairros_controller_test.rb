require 'test_helper'

class BairrosControllerTest < ActionController::TestCase
  setup do
    @bairro = bairros(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bairros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bairro" do
    assert_difference('Bairro.count') do
      post :create, :bairro => @bairro.attributes
    end

    assert_redirected_to bairro_path(assigns(:bairro))
  end

  test "should show bairro" do
    get :show, :id => @bairro.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bairro.to_param
    assert_response :success
  end

  test "should update bairro" do
    put :update, :id => @bairro.to_param, :bairro => @bairro.attributes
    assert_redirected_to bairro_path(assigns(:bairro))
  end

  test "should destroy bairro" do
    assert_difference('Bairro.count', -1) do
      delete :destroy, :id => @bairro.to_param
    end

    assert_redirected_to bairros_path
  end
end
