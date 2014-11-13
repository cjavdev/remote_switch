require 'rails_helper'

feature 'User can sign out' do
  let(:user) { FactoryGirl.create(:user) }

  scenario 'successfully' do
    sign_in_user(user)
    click_button 'Sign Out'
    visit root_url
    expect(page).to have_button("Sign In")
  end
end
