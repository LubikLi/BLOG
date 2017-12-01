class AddImageToTagsTable < ActiveRecord::Migration[5.0]
  def change
    add_column :tags, :tag_image, :string
  end
end
