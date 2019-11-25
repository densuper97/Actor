class RenameColumnLanguages < ActiveRecord::Migration[5.2]
  def change
    rename_column :languages, :language, :name
  end
end
