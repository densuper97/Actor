class CreateWorkPermits < ActiveRecord::Migration[5.2]
  def change
    create_table :work_permits , :id => false do |t|
      t.belongs_to :actors
      t.belongs_to :countries 
      t.timestamps
    end
  end
end
