require 'rails_helper'

feature 'User can sign up', type: :feature do
  scenario 'successfully' do
    visit new_user_path
    email = Faker::Internet.email
    fill_in 'Email', with: email
    fill_in 'Password', with: 'password'
    click_button 'Sign Up'
    expect(page).to have_content("Welcome, #{ email }")
  end

  scenario 'unsuccessfully' do
    visit new_user_path
    click_button 'Sign Up'
    expect(page).to have_content("Email can't be blank")
  end
end
