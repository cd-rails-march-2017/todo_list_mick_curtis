require 'rails_helper'
feature "User creates an account" do
  before(:each) do
    visit users_new_path
  end
  scenario "successfully creates a new user" do
    fill_in "user[username]", with: "Joe12345"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_button "Register"
    expect(page).to have_content "Welcome, Joe12345"
    expect(page).to have_current_path(tasks_path)
  end
  scenario "unsuccessfully creates a new user" do
    click_button "Register"
    expect(current_path).to eq(users_new_path)
  end
  scenario "passwords do not match" do
    fill_in "user[username]", with: "Joe12345"
    fill_in "user[password]", with: "password1"
    fill_in "user[password_confirmation]", with: "password"
    click_button "Register"
    expect(page).to have_content"Password confirmation doesn't match Password"
    expect(current_path).to eq(users_new_path)
  end
end
