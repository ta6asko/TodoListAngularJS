require "rails_helper"

feature "Comment", :js => true do

  let (:comment) { Faker::Lorem.characters(10) }
  
  before do
    @user = create(:user)
    login_as(@user, scope: :user)
    @project = create(:project, title: "test_project", user: @user)
    @task = create(:task, title: "test", deadline: "05,  February, 2015", project_id: @project.id)
  end

  scenario "Create Comment" do
    visit "/"
    click_link 'test' 
    fill_in 'create_comment_input', with: comment
    click_button I18n.t('comment.add_comment')
    expect(page).to have_content comment
  end

  scenario "Create Comment from paperclip icon" do
    @comment = create(:comment, task_id: @task.id)
    visit "/"
    click_link 'test'
    page.find('.comment').hover
    page.find('.icon_comment').click 
    fill_in 'create_comment_input', with: comment
    click_button I18n.t('comment.add_comment')
    expect(page).to have_content comment
  end

  scenario "Delete Comment" do
    @comment = create(:comment, text: "test_text", task_id: @task.id)
    visit "/"
    click_link 'test'
    page.find('.comment').hover
    page.find('.icon_trash_comment').click 
    expect(page).to have_no_content "test_text"
  end
end