class CreateCharacterClassesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :character_classes do |t|
      t.string :name
      t.string :picture
      t.integer :hit_points
      t.integer :attack_power
    end
  end
end
