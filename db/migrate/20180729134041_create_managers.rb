class CreateManagers < ActiveRecord::Migration[5.2]
  def change
    create_table :managers do |t|
      t.belongs_to :user
      t.string :name
      t.string :last_name
      t.timestamps
    end
  end
end
