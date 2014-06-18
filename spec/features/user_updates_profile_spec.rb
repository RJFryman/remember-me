require 'spec_helper'

feature "Update Profile" do
  scenario "User can update their user information" do
    robert = Fabricate(:user, email: "robert@example.com", username: "robert")
    login_as robert
    visit root_path
    click_link "My Profile"
    click_link "Edit My Profile"
    fill_in "Name", with: "Robert Fryman"
    fill_in "Phone", with: "123-456-7890"
    fill_in "Website", with: "example.com"
    fill_in "Address", with: "123 First Rd"
    fill_in "City", with: "Nashville"
    fill_in "State", with: "Tennessee"
    fill_in "Zip", with: "37210"
    click_button "Save Changes"
    page.should have_content "Your profile has been updated"
    page.should have_content "Robert Fryman"
    page.should have_content "123-456-7890"
    page.should have_content "example.com"
    page.should have_content "example.com"
    page.should have_content "123 First Rd"
    page.should have_content "Nashville"
    page.should have_content "Tennessee"
    page.should have_content "37210"
  end
end
