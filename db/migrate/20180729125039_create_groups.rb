class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups, :primary_key => :id do |t|
      t.string :name
      t.timestamps
    end
  end
end