class CreateVisaTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :visa_types do |t|
      t.string :name
      t.belongs_to :country
      t.timestamps
    end
  end
end
