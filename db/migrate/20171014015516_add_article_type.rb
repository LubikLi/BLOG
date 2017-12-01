class AddArticleType < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :article_type, :integer
  end
end
