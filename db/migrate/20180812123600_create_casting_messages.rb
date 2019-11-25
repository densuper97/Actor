class CreateCastingMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :casting_messages do |t|

      t.timestamps
    end
  end
end
