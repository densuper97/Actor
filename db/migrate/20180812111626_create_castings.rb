class CreateCastings < ActiveRecord::Migration[5.2]
  def change
    create_table :castings do |t|
      t.belongs_to :character
      t.belongs_to :actor
      t.belongs_to :manager
      t.boolean :active
      t.timestamps
    end
  end
end
