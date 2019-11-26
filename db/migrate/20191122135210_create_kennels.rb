class CreateKennels < ActiveRecord::Migration[5.2]
  def change
    create_table :kennels do |t|
      t.string :name
      t.string :address
      t.integer :capacity
      t.text :description
      t.integer :total_rating
      t.boolean :day_care
      t.boolean :dog_walking
      t.boolean :behaviorist
      t.float :daily_price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
