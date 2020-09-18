class ArticlesController < ApplicationController
  before_action :find_article,
                except: %i[new create index from_author my_articles]
  before_action :authenticate_user!,
                only: %i[new create edit update destroy my_articles]

  def index
    @articles = Article.all
  end

  def show; end

  def new
    @article = Article.new
    @categories = Category.all
  end

  def create
    @article = current_user.articles.create(article_params)
    @article.save_categories
    redirect_to @article
  end

  def edit
    @categories = Category.all
  end

  def update
    @article.update(article_params)
    @article.save_categories
    redirect_to @article
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  def find_article
    @article = Article.find(params[:id])
  end

  def from_author
    @user = User.find(params[:id])
  end

  def my_articles
    @user = User.find(current_user.id)
  end

  def article_params
    params.require(:article).permit(
      :title,
      :content,
      :id,
      category_elements: []
    )
  end
end
