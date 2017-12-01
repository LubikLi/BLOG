# == Schema Information
#
# Table name: articles
#
#  id                :integer          not null, primary key
#  title             :string(255)
#  text              :text(65535)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#  article_type      :integer
#  terms_of_service  :boolean          default(FALSE)
#  main_photo        :string(255)
#  rank              :integer
#  is_recommend      :boolean
#  author_id         :integer
#  impressions_count :integer
#
# Indexes
#
#  index_articles_on_title  (title)
#

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
