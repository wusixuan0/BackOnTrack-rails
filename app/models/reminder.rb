class Reminder < ApplicationRecord

  validates :doctor_id, presence: true
  validates :client_id, presence: true
  validates :title, presence: true
  validates :content, presence: true
end
