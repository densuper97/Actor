class Country < ApplicationRecord
    has_many :actors, :through => :citizenships
    has_many :visas
end
