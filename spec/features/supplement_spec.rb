require "rails_helper"

feature "Supplement", :js => true do

  let (:file)    { File.join(Rails.root, '/spec/test.pdf') }

  before do
    @user = create(:user)
    login_as(@user, scope: :user)
    @project = create(:project, title: "test_project", user: @user)
    @task = create(:task, title: "test_task", deadline: "05,  February, 2015", project_id: @project.id)
    @comment = create(:comment, text: "test_comment", task_id: @task.id)
  end

  scenario "Add file" do
    visit "/"
    click_link 'test_task'
    page.find('.icon_paperclip').click 
    page.find('#file').click
    attach_file('file', file) 
    expect(page).to have_css ".file"
    sleep 5
  end

  scenario "Delete file" do
    visit "/"
    click_link 'test_task'
    page.find('.icon_paperclip').click 
    page.find('#file').click
    attach_file('file', file) 
    page.find('.icon_trash_file').click
    expect(page).to have_no_content "test.pdf"
  end

end