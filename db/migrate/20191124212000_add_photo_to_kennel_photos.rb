class AddPhotoToKennelPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :kennel_photos, :photo, :string
  end
end
