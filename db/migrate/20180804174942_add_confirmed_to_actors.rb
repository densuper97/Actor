class AddConfirmedToActors < ActiveRecord::Migration[5.2]
  def change
    add_column :actors, :confirmed, :boolean, default: false
  end
end
