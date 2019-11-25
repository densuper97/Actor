class CreateActors < ActiveRecord::Migration[5.2]
  def change
    create_table :actors do |t|
      t.string :name
      t.string :second_name
      t.string :last_name
      t.float  :height
      t.belongs_to :manager
      t.belongs_to :user
      t.timestamps
    end
  end
end
