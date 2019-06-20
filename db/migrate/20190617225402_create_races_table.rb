class CreateRacesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :races do |t|
      t.string :name
      t.string :picture
      t.integer :hit_points
      t.integer :attack_power
      t.integer :defense
    end
  end
end
