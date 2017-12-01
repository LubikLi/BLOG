class AddRankMainphotoIsrecommendToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :main_photo, :string
    add_column :articles, :rank, :integer
    add_column :articles, :is_recommend, :boolean
    add_column :articles, :author_id, :integer
    add_column :articles, :impressions_count, :integer
  end
end
