class Room < ApplicationRecord
  belongs_to :user
  belongs_to :diviner

  has_many :messages
end
