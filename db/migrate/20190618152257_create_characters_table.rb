class CreateCharactersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :character_class_id
      t.integer :profession_id
      t.integer :race_id
      t.integer :user_id
    end
  end
end
