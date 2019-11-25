class Visa < ApplicationRecord
  belongs_to :actor
  belongs_to :visa_types
end
