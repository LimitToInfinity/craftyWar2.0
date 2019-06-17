class CreateProfessionsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :professions do |t|
      t.string :name
    end
  end
end
