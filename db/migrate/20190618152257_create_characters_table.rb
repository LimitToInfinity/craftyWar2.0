class CreateCharactersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.references :character_class, foreign_key: true
      t.references :profession, foreign_key: true
      t.references :race, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
