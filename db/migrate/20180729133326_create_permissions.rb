class CreatePermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :permissions , :primary_key => :id do |t|
      t.belongs_to :role
      t.string :page
      t.timestamps
    end
  end
end
