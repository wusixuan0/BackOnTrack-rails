class Relation < ApplicationRecord
  belongs_to :doctor
  belongs_to :client
end
