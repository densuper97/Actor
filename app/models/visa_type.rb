class VisaType < ApplicationRecord
  belongs_to :country
  has_many :visas
end
