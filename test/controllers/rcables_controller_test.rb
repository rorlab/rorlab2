require 'test_helper'

class RcablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rcable = rcables(:one)
  end

  test "should get index" do
    get rcables_url
    assert_response :success
  end

  test "should get new" do
    get new_rcable_url
    assert_response :success
  end

  test "should create rcable" do
    assert_difference('Rcable.count') do
      post rcables_url, params: { rcable: { name: @rcable.name, user_id: @rcable.user_id } }
    end

    assert_redirected_to rcable_url(Rcable.last)
  end

  test "should show rcable" do
    get rcable_url(@rcable)
    assert_response :success
  end

  test "should get edit" do
    get edit_rcable_url(@rcable)
    assert_response :success
  end

  test "should update rcable" do
    patch rcable_url(@rcable), params: { rcable: { name: @rcable.name, user_id: @rcable.user_id } }
    assert_redirected_to rcable_url(@rcable)
  end

  test "should destroy rcable" do
    assert_difference('Rcable.count', -1) do
      delete rcable_url(@rcable)
    end

    assert_redirected_to rcables_url
  end
end
