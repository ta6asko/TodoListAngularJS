require "rails_helper"

feature "Task", :js => true do
  let (:task_title) { Faker::Lorem.characters(10) }
  let (:deadline) { Faker::Date.between(2.days.ago, Date.today) }
  
  before do
    @user = create(:user)
    login_as(@user, scope: :user)
    @project = create(:project, title: "test", user: @user)
    @task = create(:task, project_id: @project.id)
  end

  scenario "Create Task" do
    visit "/"
    fill_in 'create_task_input', with: task_title
    fill_in 'deadline', with: deadline
    click_button I18n.t('task.add_task')
    expect(page).to have_content task_title
  end

  scenario "Update Task" do
    visit "/"
    page.find('.task').hover
    page.find('.icon_edit_task').click
    fill_in 'update_task_input', with: task_title
    click_button I18n.t('task.update_task')
    expect(page).to have_content task_title
  end

  scenario "Complite Task" do
    visit "/"
    page.find('#task_box').click
    expect(page.find('#task_box')).to be_checked
  end

  scenario "Delete Task" do
    visit "/"
    page.find('.task').hover
    page.find('.icon_trash_task').click
    expect(page).to have_no_content '.task'
  end
end
