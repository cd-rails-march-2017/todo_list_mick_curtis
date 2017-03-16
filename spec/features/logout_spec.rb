require 'rails_helper'
feature "User logs out" do
  scenario "user sucessfully logs out" do
    register_user
    click_on "Log out"
    expect(page).to have_content "Login"
    expect(current_path).to eq('/login')
  end
end
