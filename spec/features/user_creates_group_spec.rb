require 'spec_helper'

feature "New Groups" do
  scenario "user creates a new group" do
    login_as Fabricate(:user, name: "Robert", phone:"123-456-7890", email:"robert@example.com")
    click_link "Create a group"
    fill_in "Name", with: "Test-Group"
    fill_in "Invitation Code", with: "512asfT5"
    check "Phone"
    check "Email"
    click_button "Create Group"
    page.should have_content "Group successfully created."
    page.should have_content "Test-Group"
    page.should have_content "Members:"
    page.should have_link "Robert"
    page.should have_content "123-456-7890"
    page.should have_content "robert@example.com"
  end

  scenario "failed group creation no name" do
    login_as Fabricate(:user)
    click_link "Create a group"
    fill_in "Name", with: ""
    click_button "Create Group"
    page.should have_content "Your group couldn't be created."
    page.should have_error "can't be blank", on: "Name"
  end

  scenario "failed group creation no name" do
    login_as Fabricate(:user)
    click_link "Create a group"
    fill_in "Name", with: "12345"
    click_button "Create Group"
    page.should have_content "Your group couldn't be created."
    page.should have_error "names must contain atleast one letter.", on: "Name"
  end

  scenario "failed group create name used" do
    Fabricate(:group, name: "Test Group", invitation_code: "1")
    login_as Fabricate(:user)
    click_link "Create a group"
    fill_in "Name", with: "Test Group"
    fill_in "Invitation Code", with: "1"
    click_button "Create Group"
    page.should have_content "Your group couldn't be created."
    page.should have_error "has already been taken", on: "Invitation Code"
  end
end
