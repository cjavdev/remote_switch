require 'rails_helper'

feature 'User can sign in' do
  subject(:user) { FactoryGirl.create(:user, password: "password") }

  scenario 'successfully' do
    visit new_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: "password"
    click_button 'Sign In'
    expect(page).to have_content("Welcome, #{ user.email }")
  end

  scenario 'unsuccessfully' do
    visit new_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: "notpassword"
    click_button 'Sign In'
    expect(page).to have_content("Invalid email and/or password")
  end
end
