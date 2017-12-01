class AddIndexToArticle < ActiveRecord::Migration[5.0]
  def change
    add_index :articles, :title
  end
end
