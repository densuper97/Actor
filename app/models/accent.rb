class Accent < ApplicationRecord
  belongs_to :actors
  belongs_to :languages
  belongs_to :accent_types
end
