require "application_system_test_case"

class RcablesTest < ApplicationSystemTestCase
  setup do
    @rcable = rcables(:one)
  end

  test "visiting the index" do
    visit rcables_url
    assert_selector "h1", text: "Rcables"
  end

  test "creating a Rcable" do
    visit rcables_url
    click_on "New Rcable"

    fill_in "Name", with: @rcable.name
    fill_in "User", with: @rcable.user_id
    click_on "Create Rcable"

    assert_text "Rcable was successfully created"
    click_on "Back"
  end

  test "updating a Rcable" do
    visit rcables_url
    click_on "Edit", match: :first

    fill_in "Name", with: @rcable.name
    fill_in "User", with: @rcable.user_id
    click_on "Update Rcable"

    assert_text "Rcable was successfully updated"
    click_on "Back"
  end

  test "destroying a Rcable" do
    visit rcables_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rcable was successfully destroyed"
  end
end
