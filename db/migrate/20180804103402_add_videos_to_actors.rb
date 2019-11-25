class AddVideosToActors < ActiveRecord::Migration[5.2]
  def change
    add_column :actors, :videos, :string
  end
end
