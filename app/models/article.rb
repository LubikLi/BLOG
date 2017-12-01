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

class Article < ApplicationRecord
  after_destroy :article_destroy
  validates :title, presence: true, length: {minimum: 5}
  # validates :terms_of_service_box, presence: true, :acceptance => {accept: '1', message: 'must be abided'}


  # belongs_to :user
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags
  has_many :pictures, as: :imageable

  enum article_type: {article_photo: 0, video_article: 1}
  scope :photo_article, -> {where(article_type: 0)}

  def article_destroy
    p'====================='
    p 'Article destroyed'
    p'====================='
  end

end
