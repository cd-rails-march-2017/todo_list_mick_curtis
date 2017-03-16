require "rails_helper"
module CapybaraHelpers
  def register_user(username: 'MyString', password: "MyString", password_confirmation: "MyString")
    visit users_new_path unless current_path == users_new_path
    fill_in "user[username]", with: username
    fill_in "user[password]", with: password
    fill_in "user[password_confirmation]", with: password_confirmation
    click_button "Register"
  end
end
