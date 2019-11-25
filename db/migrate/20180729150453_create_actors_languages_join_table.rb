class CreateActorsLanguagesJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :actors, :languages do |t|
      # t.index [:actor_id, :language_id]
      # t.index [:language_id, :actor_id]
    end
  end
end
