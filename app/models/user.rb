class User < ApplicationRecord
  has_secure_password
  validates :first_name, :last_name, :password, :password_confirmation, presence: true
  validates :email, uniqueness: {case_sensitive: false}, presence: true
  has_many :reminders
end
