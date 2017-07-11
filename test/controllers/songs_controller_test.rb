require 'test_helper'

class SongsControllerTest < ActionController::TestCase
  setup do
    @mix = mixes(:one)
    @song = songs(:one)
  end

  test "should get index" do
    get :index, params: { mix_id: @mix }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { mix_id: @mix }
    assert_response :success
  end

  test "should create song" do
    assert_difference('Song.count') do
      post :create, params: { mix_id: @mix, song: @song.attributes }
    end

    assert_redirected_to mix_song_path(@mix, Song.last)
  end

  test "should show song" do
    get :show, params: { mix_id: @mix, id: @song }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { mix_id: @mix, id: @song }
    assert_response :success
  end

  test "should update song" do
    put :update, params: { mix_id: @mix, id: @song, song: @song.attributes }
    assert_redirected_to mix_song_path(@mix, Song.last)
  end

  test "should destroy song" do
    assert_difference('Song.count', -1) do
      delete :destroy, params: { mix_id: @mix, id: @song }
    end

    assert_redirected_to mix_songs_path(@mix)
  end
end
