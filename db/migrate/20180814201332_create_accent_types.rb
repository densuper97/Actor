class CreateAccentTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :accent_types do |t|
      t.string "name"
      t.timestamps
    end
  end
end
