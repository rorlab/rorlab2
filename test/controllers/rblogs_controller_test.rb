require 'test_helper'

class RblogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rblog = rblogs(:one)
  end

  test "should get index" do
    get rblogs_url
    assert_response :success
  end

  test "should get new" do
    get new_rblog_url
    assert_response :success
  end

  test "should create rblog" do
    assert_difference('Rblog.count') do
      post rblogs_url, params: { rblog: { content: @rblog.content, shared: @rblog.shared, title: @rblog.title, writer_id: @rblog.writer_id } }
    end

    assert_redirected_to rblog_url(Rblog.last)
  end

  test "should show rblog" do
    get rblog_url(@rblog)
    assert_response :success
  end

  test "should get edit" do
    get edit_rblog_url(@rblog)
    assert_response :success
  end

  test "should update rblog" do
    patch rblog_url(@rblog), params: { rblog: { content: @rblog.content, shared: @rblog.shared, title: @rblog.title, writer_id: @rblog.writer_id } }
    assert_redirected_to rblog_url(@rblog)
  end

  test "should destroy rblog" do
    assert_difference('Rblog.count', -1) do
      delete rblog_url(@rblog)
    end

    assert_redirected_to rblogs_url
  end
end
