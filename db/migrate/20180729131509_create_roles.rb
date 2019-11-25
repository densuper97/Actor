class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles, :primary_key => :id  do |t|
      t.string :name
      t.belongs_to :group
      t.timestamps
    end
  end
end
