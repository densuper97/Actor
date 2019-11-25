class ChangeActors < ActiveRecord::Migration[5.2]
  def change
    change_column :actors, :confirmed, :string
  end
end
