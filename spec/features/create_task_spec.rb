require 'rails_helper'
feature 'User can create a task' do
  scenario "user sucessfully creates a task" do
    register_user
    click_on "Create a To Do Item"
    fill_in "task[content]", with: "Shovel Snow"
    fill_in "task[due_date]", with: "2017/04/04"
    click_button "Create Task"
    expect(page).to have_content "Shovel Snow"
    expect(current_path).to eq('/tasks')
  end
  scenario "user unsucessfully creates a task" do
    register_user
    click_on "Create a To Do Item"
    click_button "Create Task"
    expect(page).to have_content "Content can't be blank"
    expect(current_path).to eq('/tasks/new')

  end
  scenario "user can complete a task" do
    register_user
    click_on "Create a To Do Item"
    fill_in "task[content]", with: "Shovel Snow"
    fill_in "task[due_date]", with: "2017/04/04"
    click_button "Create Task"
    click_on "Create a To Do Item"
    fill_in "task[content]", with: "Shovel Snow2"
    fill_in "task[due_date]", with: "2017/04/05"
    click_button "Create Task"
    first(".task").click_on "Complete"
    expect(page).to have_button(value: "Nevermind")
    expect(page).to have_button(value: "Complete")
  end
end
