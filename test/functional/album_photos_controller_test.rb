require 'test_helper'

class AlbumPhotosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:album_photos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create album_photo" do
    assert_difference('AlbumPhoto.count') do
      post :create, :album_photo => { }
    end

    assert_redirected_to album_photo_path(assigns(:album_photo))
  end

  test "should show album_photo" do
    get :show, :id => album_photos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => album_photos(:one).to_param
    assert_response :success
  end

  test "should update album_photo" do
    put :update, :id => album_photos(:one).to_param, :album_photo => { }
    assert_redirected_to album_photo_path(assigns(:album_photo))
  end

  test "should destroy album_photo" do
    assert_difference('AlbumPhoto.count', -1) do
      delete :destroy, :id => album_photos(:one).to_param
    end

    assert_redirected_to album_photos_path
  end
end
