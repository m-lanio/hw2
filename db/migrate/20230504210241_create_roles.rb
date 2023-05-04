class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.string "movie_id" #"Name" is name of column.
      t.string "actor_id"
      t.string "character_name"
      
      t.timestamps
    end
  end
end
