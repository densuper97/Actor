class AddBirthDateToActors < ActiveRecord::Migration[5.2]
  def change
    add_column :actors, :birth_date, :date
  end
end
