class CreateKennelPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :kennel_photos do |t|
      t.string :url
      t.references :kennel, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :primary

      t.timestamps
    end
  end
end
