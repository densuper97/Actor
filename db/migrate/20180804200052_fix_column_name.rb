class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :actors, :name, :first_name
    rename_column :actors, :second_name, :middle_name
  end
end
