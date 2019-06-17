class CreateRacesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :races do |t|
      t.string :name
    end
  end
end
