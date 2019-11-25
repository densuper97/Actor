class ChangeActorsConfirmedDeafult < ActiveRecord::Migration[5.2]
  def change
    change_column :actors, :confirmed, :string, default: 'N'
  end
end
