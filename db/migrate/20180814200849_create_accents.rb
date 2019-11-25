class CreateAccents < ActiveRecord::Migration[5.2]
  def change
    create_table :accents do |t|
      t.belongs_to :actors
      t.belongs_to :languages
      t.belongs_to :accent_types
      t.timestamps
    end
  end
end
