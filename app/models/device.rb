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

class Device < ActiveRecord::Base
  validates :user, :name, presence: true
  validates :name, uniqueness: { scope: :user }

  belongs_to :user
end
