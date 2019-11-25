class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries, :primary_key => :country_code do |t|
      t.string :name
      t.timestamps
    end
  end
end
