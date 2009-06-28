require 'test_helper'

class BreadcrumbsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:breadcrumbs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create breadcrumb" do
    assert_difference('Breadcrumb.count') do
      post :create, :breadcrumb => { }
    end

    assert_redirected_to breadcrumb_path(assigns(:breadcrumb))
  end

  test "should show breadcrumb" do
    get :show, :id => breadcrumbs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => breadcrumbs(:one).to_param
    assert_response :success
  end

  test "should update breadcrumb" do
    put :update, :id => breadcrumbs(:one).to_param, :breadcrumb => { }
    assert_redirected_to breadcrumb_path(assigns(:breadcrumb))
  end

  test "should destroy breadcrumb" do
    assert_difference('Breadcrumb.count', -1) do
      delete :destroy, :id => breadcrumbs(:one).to_param
    end

    assert_redirected_to breadcrumbs_path
  end
end
