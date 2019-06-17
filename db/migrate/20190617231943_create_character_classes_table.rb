class CreateCharacterClassesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :character_classes do |t|
      t.string :name
    end
  end
end
