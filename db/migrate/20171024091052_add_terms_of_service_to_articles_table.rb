class AddTermsOfServiceToArticlesTable < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :terms_of_service, :boolean, default: false
  end
end
