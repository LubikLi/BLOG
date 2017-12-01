class AddImageableIdToPicturesTable < ActiveRecord::Migration[5.0]
  def change
    add_column :pictures, :imageable_id, :integer
    add_column :pictures, :imageable_type, :string
    add_column :pictures, :name, :string
  end
end
