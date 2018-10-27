class Event < ApplicationRecord
  validates :start, :end, :title, :description, :doctor_id, :client_id, presence: true
end
