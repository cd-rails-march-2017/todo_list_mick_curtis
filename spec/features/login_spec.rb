require 'rails_helper'
feature "User creates an account" do
  before(:each) do
    visit login_path
  end
  scenario "successfully login a user" do
    create(:user)
    fill_in "username", with: "MyString"
    fill_in "password", with: "MyString"
    click_button 'Login'
    expect(page).to have_content "Welcome, MyString"
    expect(page).to have_current_path(tasks_path)
  end
  scenario "unsuccessfully login a user" do
    click_button 'Login'
    expect(page).to have_content"Invalid username or password"
    expect(page).to have_current_path(login_path)
  end
end
