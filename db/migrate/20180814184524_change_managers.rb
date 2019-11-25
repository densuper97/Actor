class ChangeManagers < ActiveRecord::Migration[5.2]
  def change
    rename_column :managers, :name, :first_name
  end
end
