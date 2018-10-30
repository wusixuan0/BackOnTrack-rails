class Reminder < ApplicationRecord
  belongs_to :doctor
  belongs_to :client
  validates :title, presence: true
  validates :content, presence: true
end
