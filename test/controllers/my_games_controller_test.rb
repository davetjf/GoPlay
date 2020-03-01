require 'test_helper'

class MyGamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @my_game = my_games(:one)
  end

  test "should get index" do
    get my_games_url
    assert_response :success
  end

  test "should get new" do
    get new_my_game_url
    assert_response :success
  end

  test "should create my_game" do
    assert_difference('MyGame.count') do
      post my_games_url, params: { my_game: { date: @my_game.date, game_name: @my_game.game_name, game_type: @my_game.game_type, isPrivate: @my_game.isPrivate, player_four: @my_game.player_four, player_one: @my_game.player_one, player_three: @my_game.player_three, player_two: @my_game.player_two } }
    end

    assert_redirected_to my_game_url(MyGame.last)
  end

  test "should show my_game" do
    get my_game_url(@my_game)
    assert_response :success
  end

  test "should get edit" do
    get edit_my_game_url(@my_game)
    assert_response :success
  end

  test "should update my_game" do
    patch my_game_url(@my_game), params: { my_game: { date: @my_game.date, game_name: @my_game.game_name, game_type: @my_game.game_type, isPrivate: @my_game.isPrivate, player_four: @my_game.player_four, player_one: @my_game.player_one, player_three: @my_game.player_three, player_two: @my_game.player_two } }
    assert_redirected_to my_game_url(@my_game)
  end

  test "should destroy my_game" do
    assert_difference('MyGame.count', -1) do
      delete my_game_url(@my_game)
    end

    assert_redirected_to my_games_url
  end
end
