class AddPhoneToActors < ActiveRecord::Migration[5.2]
  def change
    add_column :actors, :phone, :string
  end
end
