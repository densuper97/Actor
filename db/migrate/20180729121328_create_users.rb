class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, :primary_key => :id do |t|
      t.string  :email
      t.string :login
      t.string  :password
      t.string :password_digest
      t.belongs_to :group
      t.timestamps
    end
  end
end
