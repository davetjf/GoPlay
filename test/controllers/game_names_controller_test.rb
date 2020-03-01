require 'test_helper'

class GameNamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_name = game_names(:one)
  end

  test "should get index" do
    get game_names_url
    assert_response :success
  end

  test "should get new" do
    get new_game_name_url
    assert_response :success
  end

  test "should create game_name" do
    assert_difference('GameName.count') do
      post game_names_url, params: { game_name: { name: @game_name.name } }
    end

    assert_redirected_to game_name_url(GameName.last)
  end

  test "should show game_name" do
    get game_name_url(@game_name)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_name_url(@game_name)
    assert_response :success
  end

  test "should update game_name" do
    patch game_name_url(@game_name), params: { game_name: { name: @game_name.name } }
    assert_redirected_to game_name_url(@game_name)
  end

  test "should destroy game_name" do
    assert_difference('GameName.count', -1) do
      delete game_name_url(@game_name)
    end

    assert_redirected_to game_names_url
  end
end
