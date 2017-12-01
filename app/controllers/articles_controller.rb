class ArticlesController < ApplicationController
  # http_basic_authenticate_with name: "lizhe", password: "123456", except: [:index, :show]
  # before_action :authenticate_user!
  def index
    @tags = Tag.all
    articles_set = Article.all
    @article_type = Article.photo_article

    if params[:tag_id]
      articles_set = Article.joins(:tags).where(tags:{id: params[:tag_id]}).distinct
    end
    @articles = articles_set.page(params[:page]).per(5)
    @tag = Tag.find(params[:tag_id])


    @hot_tags = Tag.left_outer_joins(:articles).distinct.select('tags.*, COUNT(articles_tags.tag_id) AS article_count').group('tags.id')
  end

  def show
    @article = Article.find(params[:id])
    @commenter = Article.where(commenter: '李哲')
  end

  def new
    @article = Article.new()
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.create(article_params)
      update_tags
      redirect_to @article
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end

    update_tags
  end


  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :text, :article_type, :terms_of_service, :user_id)
  end

  def tags_params
    params[:tags]
  end

  def update_tags
    return unless tags_params.present?

    tags = tags_params.map do |name|
      Tag.find_or_create_by(name: name)
    end

    @article.tags = tags
  end
end

