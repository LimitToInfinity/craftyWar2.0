class CreateMonstersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :monsters do |t|
      t.string :name
      t.integer :hit_points
      t.integer :attack_power
    end
  end
end
