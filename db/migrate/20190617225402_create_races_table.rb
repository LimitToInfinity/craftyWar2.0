class CreateRacesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :races do |t|
      t.string :name
      t.string :picture
    end
  end
end
