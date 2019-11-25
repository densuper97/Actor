class AddPhotosToActors < ActiveRecord::Migration[5.2]
  def change
    add_column :actors, :photos, :string
  end
end
