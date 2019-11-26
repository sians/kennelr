class AddPictureToDogs < ActiveRecord::Migration[5.2]
  def change
    add_column :dogs, :picture, :string
  end
end
