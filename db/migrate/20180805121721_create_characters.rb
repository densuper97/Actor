class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :title
      t.string :description
      t.boolean :open
      t.belongs_to :actor
      t.belongs_to :manager
      t.timestamps
    end
  end
end
