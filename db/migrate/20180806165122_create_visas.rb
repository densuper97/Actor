class CreateVisas < ActiveRecord::Migration[5.2]
  def change
    create_table :visas do |t|
      t.string :status
      t.date :begin
      t.date :end
      t.timestamps
    end
  end
end
