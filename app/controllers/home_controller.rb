class HomeController < ApplicationController
  def index
    @tags = Tag.all
    articles_set = Article.all
    @article_type = Article.photo_article
    if params[:tag_id]
      articles_set = Article.joins(:tags).where(tags: {id: params[:tag_id]}).distinct
    end
    @articles = articles_set.page(params[:page]).per(6)

  end
end
