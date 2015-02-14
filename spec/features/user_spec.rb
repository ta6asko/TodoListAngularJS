require "rails_helper"

feature "User", :js => true do

  before do
    @user = create(:user)
  end 

  scenario "Pressing the link 'Sign up' in 'Sign in' page" do
    visit new_user_session_path
    click_link I18n.t('user.sign_up')
    expect(page).to have_content "Have an account?" 
  end

  scenario "Pressing the link 'Sign in' in 'Sign up' page" do
    visit new_user_registration_path
    click_link I18n.t('user.sign_in')
    expect(page).to have_content "Don't have an account?"
  end

  scenario "Pressing the button 'Sign in'" do
    @user = create(:user, email: "test@gmail.com", password: '12345678')
    visit new_user_session_path
    within ".new_user" do
      fill_in 'user_email', with: "test@gmail.com"
      fill_in 'user_password', with: '12345678'
      click_button I18n.t('user.sign_in')
    end
    expect(page).not_to have_content "Don't have an account?"
    expect(page).to have_content "Signed in successfully."
  end

  scenario "Pressing the button 'Sign up'" do
    visit new_user_registration_path
    within ".new_user" do
      fill_in 'user_email', with: Faker::Internet.email
      fill_in 'user_password', with: '12345678'
      fill_in 'user_password_confirmation', with: '12345678'
      click_button I18n.t('user.sign_up')
    end
    expect(page).not_to have_content "Have an account?"
    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  scenario "omniauth-facebook" do
    visit new_user_session_path
    first(".facebook").click
    expect(page).to have_content "Successfully authenticated from Facebook account."
  end
  
  scenario "omniauth-facebook" do
    visit new_user_registration_path
    first(".facebook").click
    expect(page).to have_content "Successfully authenticated from Facebook account."
  end

  scenario "logout" do
    login_as(@user, scope: :user)
    visit "/"
    click_link I18n.t('user.sign_out')
    expect(page).to have_content I18n.t('user.sign_up')
  end
end