require 'rails_helper'

feature 'User can view devices' do
  let(:user) { FactoryGirl.create(:user, password: "password") }

  scenario 'only if logged in' do
    visit devices_url

    expect(page).not_to have_css 'h1', text: 'Devices'
    expect(page).to have_button 'Sign In'
  end

  scenario 'successfully' do
    sign_in_user(user)
    FactoryGirl.create(:device, user: user)

    visit devices_url

    expect(page).to have_css 'h1', text: 'Devices'
    expect(page).to have_css 'ul.devices li'
  end
end
