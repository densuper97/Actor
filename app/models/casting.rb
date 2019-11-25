class Casting < ApplicationRecord
  belongs_to :character
  belongs_to :manager
  belongs_to :actor
end
