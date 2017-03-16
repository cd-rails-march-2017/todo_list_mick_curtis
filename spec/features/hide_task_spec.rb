require 'rails_helper'
feature 'User can create a task' do
  scenario "hide all completed tasks" do
    register_user
    click_on "Create a To Do Item"
    fill_in "task[content]", with: "Shovel Snow"
    fill_in "task[due_date]", with: "2017/04/04"
    click_button "Create Task"
    click_on "Create a To Do Item"
    fill_in "task[content]", with: "Summer"
    fill_in "task[due_date]", with: "2017/04/05"
    click_button "Create Task"
    first(".task").click_on "Complete"
    click_on "Hide completed tasks"
    expect(page).to have_content "Summer"
    expect(page).to have_no_content "Shovel Snow"
  end
end
