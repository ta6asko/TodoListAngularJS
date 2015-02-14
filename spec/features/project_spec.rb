require "rails_helper"

feature "Project", :js => true do
  let (:project_title) { Faker::Lorem.characters(10) }

  before do
    @user = create(:user)
    login_as(@user, scope: :user)
    @project = create(:project, title: "test", user: @user)
  end

  scenario "Create Project" do
    visit "/"
    click_link I18n.t('project.add_list') 
    fill_in 'create_project_input', with: project_title
    click_button I18n.t('project.add_project')
    expect(page).to have_content project_title
  end

  scenario "Update Project" do
    visit "/"
    page.find('.project_header').hover
    page.find('.icon_edit').click
    fill_in 'update_project_input', with: project_title
    click_button I18n.t('project.update_project')
    expect(page).to have_content project_title
  end

  scenario "Delete Project" do
    visit "/"
    page.find('.project_header').hover
    page.find('.icon_trash').click
    expect(page).to have_no_content "test"
  end
end