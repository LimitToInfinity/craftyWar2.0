class CreateMonsterVerbagesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :monster_verbages do |t|
      t.string :verbage
      t.references :monster, foreign_key: true
    end
  end
end
