require 'spec_helper'

feature "User signs up" do
  scenario "happy path" do
    visit root_path
    click_link "Start Remembering!"
    fill_in "Email", with: "julius@example.com"
    fill_in "Username", with: "julius"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    page.should have_content "Welcome to Remember Me!"
    page.should_not have_link "Start Remembering!"
  end

  scenario "failed signup" do
    Fabricate(:user, email: "robert@example.com", username: "robert")
    visit root_path
    click_link "Start Remembering!"
    fill_in "Email", with: "robert@example.com"
    fill_in "Username", with: "robert"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "notpassword"
    click_button "Sign up"
    page.should_not have_content "Welcome to Remember Me!"
    page.should have_error("has already been taken", on: "Email")
    page.should have_error("doesn't match Password", on: "Password confirmation")
    page.should have_error("has already been taken", on: "Username")
  end

  scenario "failed signup invaild characters in username" do
    visit root_path
    click_link "Start Remembering!"
    fill_in "Email", with: "robert@example.com"
    fill_in "Username", with: "@robert"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    page.should_not have_content "Welcome to Remember Me!"
    page.should have_error("username can only contain letters or numbers without spaces.", on: "Username")
  end

  scenario "failed signup inviald username spaces" do
    visit root_path
    click_link "Start Remembering!"
    fill_in "Email", with: "robert@example.com"
    fill_in "Username", with: "@robert"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    page.should_not have_content "Welcome to Remember Me!"
    page.should have_error("username can only contain letters or numbers without spaces.", on: "Username")
  end
end
