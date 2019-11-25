class Manager < ApplicationRecord
  belongs_to :user
  has_many :actors
  has_many :characters

  def email
    User.find(self.user_id).email
  end

  def simple_full_name
    [first_name, last_name].join(" ")
  end
end
