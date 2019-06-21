class CreateWeaponsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :weapons do |t|
      t.string :name
      t.integer :damage
      t.integer :defense
      t.string :picture
    end
  end
end
