class CreateCitizenships < ActiveRecord::Migration[5.2]
  def change
    create_table :citizenships ,:id => false do |t|
      t.belongs_to :actors
      t.belongs_to :countries
      t.timestamps
    end
  end
end
