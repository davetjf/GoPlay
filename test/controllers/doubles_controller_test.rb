require 'test_helper'

class DoublesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @double = doubles(:one)
  end

  test "should get index" do
    get doubles_url
    assert_response :success
  end

  test "should get new" do
    get new_double_url
    assert_response :success
  end

  test "should create double" do
    assert_difference('Double.count') do
      post doubles_url, params: { double: { date: @double.date, game_name: @double.game_name, player_four: @double.player_four, player_one: @double.player_one, player_three: @double.player_three, player_two: @double.player_two, result: @double.result } }
    end

    assert_redirected_to double_url(Double.last)
  end

  test "should show double" do
    get double_url(@double)
    assert_response :success
  end

  test "should get edit" do
    get edit_double_url(@double)
    assert_response :success
  end

  test "should update double" do
    patch double_url(@double), params: { double: { date: @double.date, game_name: @double.game_name, player_four: @double.player_four, player_one: @double.player_one, player_three: @double.player_three, player_two: @double.player_two, result: @double.result } }
    assert_redirected_to double_url(@double)
  end

  test "should destroy double" do
    assert_difference('Double.count', -1) do
      delete double_url(@double)
    end

    assert_redirected_to doubles_url
  end
end
