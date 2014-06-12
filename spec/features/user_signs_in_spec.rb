require 'spec_helper'

feature "User signs in" do
  scenario "happy path email" do
    Fabricate(:user, email: "robert@example.com")
    visit root_path
    click_link "Sign in"
    fill_in "Email/Username", with: "robert@example.com"
    fill_in "Password", with: "password"
    click_button "Sign in"
    page.should have_content "You have signed in successfully"
    page.should_not have_link "Start Remembering!"
  end

  scenario "happy path username" do
    Fabricate(:user, username: "robert")
    visit root_path
    click_link "Sign in"
    fill_in "Email/Username", with: "robert"
    fill_in "Password", with: "password"
    click_button "Sign in"
    page.should have_content "You have signed in successfully"
    page.should_not have_link "Start Remembering!"
  end

  scenario "failed signin wrong email" do
    Fabricate(:user, email: "robert@example.com")
    visit root_path
    click_link "Sign in"
    fill_in "Email/Username", with: "not@example.com"
    fill_in "Password", with: "password"
    click_button "Sign in"
    page.should have_content "Invalid login or password"
  end

  scenario "failed signin wrong username" do
    Fabricate(:user, username: "robert")
    visit root_path
    click_link "Sign in"
    fill_in "Email/Username", with: "notrobert"
    fill_in "Password", with: "password"
    click_button "Sign in"
    page.should have_content "Invalid login or password"
  end

  scenario "failed signin wrong password" do
    Fabricate(:user, email: "robert@example.com")
    visit root_path
    click_link "Sign in"
    fill_in "Email/Username", with: "robert@example.com"
    fill_in "Password", with: "notpassword"
    click_button "Sign in"
    page.should have_content "Invalid login or password"
  end
end
