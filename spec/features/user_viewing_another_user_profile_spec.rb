require 'spec_helper'

feature "User Profile Views" do
  let(:group1){ Fabricate(:group, name: "Test Group 1", phone: true, invitation_code: "1") }
  let(:group2){ Fabricate(:group, name: "Test Group 2", email: true, invitation_code: "2") }
  let(:group3){ Fabricate(:group, name: "Test Group 3", website: true, invitation_code: "3") }

  scenario "Viewing a user with multiple permissions from different groups" do
    robert = Fabricate(:user, name: "Robert", phone: "123-456-7890", email: "rob@example.com", website: "robert.com", groups: [group1, group2, group3])
    Fabricate(:user, name: "Sue", phone: "555-555-5555", email: "sue@example.com", website: "sue.com", groups: [group1, group2])
    Fabricate(:user, name: "John", phone: "111-111-1111", email: "john@example.com", website: "john.com", groups: [group2, group3])
    Fabricate(:user, name: "Mark", phone: "222-222-2222", email: "mark@example.com", website: "mark.com", groups: [group1])
    login_as robert
    visit group_path(group1)
    click_link "Sue"
    page.should have_content "555-555-5555"
    page.should have_content "sue@example.com"
    page.should_not have_content "sue.com"
    visit group_path(group1)
    click_link "Mark"
    page.should have_content "222-222-2222"
    page.should_not have_content "markexample.com"
    page.should_not have_content "mark.com"
    visit group_path(group2)
    click_link "John"
    page.should_not have_content "111-111-1111"
    page.should have_content "john@example.com"
    page.should have_content "john.com"
  end
end
