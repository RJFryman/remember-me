require 'spec_helper'

feature "User joins group" do
  scenario "happy path" do
    login_as Fabricate(:user, name: "Robert")
    Fabricate(:group, name: "Test Group", invitation_code: "12345")
    click_link "Join a Group"
    fill_in('Invitation Code', with: "12345")
    click_button "Join a Group"
    page.should have_content "You have been added to Test Group."
    page.should have_content "Test Group"
    page.should have_content "Members:"
    page.should have_content "Robert"
  end
end
