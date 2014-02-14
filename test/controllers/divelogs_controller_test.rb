require 'test_helper'

class DivelogsControllerTest < ActionController::TestCase
  setup do
    @divelog = divelogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:divelogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create divelog" do
    assert_difference('Divelog.count') do
      post :create, divelog: { date: @divelog.date, description: @divelog.description, latitude: @divelog.latitude, longitude: @divelog.longitude, picture: @divelog.picture, point: @divelog.point }
    end

    assert_redirected_to divelog_path(assigns(:divelog))
  end

  test "should show divelog" do
    get :show, id: @divelog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @divelog
    assert_response :success
  end

  test "should update divelog" do
    patch :update, id: @divelog, divelog: { date: @divelog.date, description: @divelog.description, latitude: @divelog.latitude, longitude: @divelog.longitude, picture: @divelog.picture, point: @divelog.point }
    assert_redirected_to divelog_path(assigns(:divelog))
  end

  test "should destroy divelog" do
    assert_difference('Divelog.count', -1) do
      delete :destroy, id: @divelog
    end

    assert_redirected_to divelogs_path
  end
end
