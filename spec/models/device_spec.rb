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

require 'rails_helper'

RSpec.describe Device, :type => :model do
  it { should validate_presence_of :user }
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should belong_to :user }
end
