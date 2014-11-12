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

class User < ActiveRecord::Base
  validates :email, :session_token, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  attr_reader :password

  before_validation :ensure_session_token

  def self.with_credentials(creds)
    user = User.find_by(email: creds[:email])
    if user && user.is_password?(creds[:password])
      user
    else
      nil
    end
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom.hex
    save!
    session_token
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.hex
  end
end
