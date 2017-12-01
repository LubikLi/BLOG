class AddBulletinToTagsTable < ActiveRecord::Migration[5.0]
  def change
    add_column :tags, :bulletin, :string
  end
end
