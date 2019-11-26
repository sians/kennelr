class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :age
      t.string :breed
      t.text :dietry_requirements
      t.text :medications
      t.references :user, foreign_key: true
      t.references :vet, foreign_key: true

      t.timestamps
    end
  end
end
