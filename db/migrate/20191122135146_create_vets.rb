class CreateVets < ActiveRecord::Migration[5.2]
  def change
    create_table :vets do |t|
      t.string :clinic_name
      t.string :primary_veterinarian
      t.string :address
      t.string :phone_num

      t.timestamps
    end
  end
end
