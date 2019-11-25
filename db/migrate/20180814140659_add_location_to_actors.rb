class AddLocationToActors < ActiveRecord::Migration[5.2]
  def change
    add_column :actors, :location, :string
  end
end
