# == Schema Information
#
# Table name: devices
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :device do
    user nil
name "MyString"
  end

end
