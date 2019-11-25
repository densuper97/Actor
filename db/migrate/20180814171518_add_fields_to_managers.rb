class AddFieldsToManagers < ActiveRecord::Migration[5.2]
  def change
    add_column :managers, :email, :string
    add_column :managers, :phone, :string
  end
end
