class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.boolean :day_care
      t.boolean :active
      t.float :total_price
      t.references :user, foreign_key: true
      t.references :kennel, foreign_key: true
      t.references :dog, foreign_key: true

      t.timestamps
    end
  end
end
