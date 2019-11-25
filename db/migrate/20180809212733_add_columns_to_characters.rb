class AddColumnsToCharacters < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :project_name, :string
    add_column :characters, :shooting_start, :date
    add_column :characters, :shooting_end, :date
    add_column :characters, :deadline, :date
  end
end
