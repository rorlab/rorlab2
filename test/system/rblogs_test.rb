require "application_system_test_case"

class RblogsTest < ApplicationSystemTestCase
  setup do
    @rblog = rblogs(:one)
  end

  test "visiting the index" do
    visit rblogs_url
    assert_selector "h1", text: "Rblogs"
  end

  test "creating a Rblog" do
    visit rblogs_url
    click_on "New Rblog"

    fill_in "Content", with: @rblog.content
    check "Shared" if @rblog.shared
    fill_in "Title", with: @rblog.title
    fill_in "Writer", with: @rblog.writer_id
    click_on "Create Rblog"

    assert_text "Rblog was successfully created"
    click_on "Back"
  end

  test "updating a Rblog" do
    visit rblogs_url
    click_on "Edit", match: :first

    fill_in "Content", with: @rblog.content
    check "Shared" if @rblog.shared
    fill_in "Title", with: @rblog.title
    fill_in "Writer", with: @rblog.writer_id
    click_on "Update Rblog"

    assert_text "Rblog was successfully updated"
    click_on "Back"
  end

  test "destroying a Rblog" do
    visit rblogs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rblog was successfully destroyed"
  end
end
