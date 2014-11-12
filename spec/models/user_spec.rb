# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  session_token   :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }

  describe '::with_credentials' do
    it 'returns a user found with the correct creds' do
      u = FactoryGirl.create(:user, password: "password")
      found = User.with_credentials({ email: u.email, password: "password" })
      expect(found).not_to be_nil
    end

    it 'returns nil for a user with incorrect email or password' do
      u = FactoryGirl.create(:user, password: "password")
      found = User.with_credentials({ email: u.email, password: "notpassword" })
      expect(found).to be_nil
    end
  end
end
