require 'pp'
class ArticlesController < ApplicationController
 
  http_basic_authenticate_with name: 'mina', password: '1029', except: [:index, :show]
 
  def index
    @articles = Article.all.order(category_id: "ASC").order(updated_at: "ASC")
    @categolies = Category.all
    @category = Article.maximum("category_id")
    @article = Article.new
    
  end
  
  def show
    pp '★★★method:::::::articles/show'
    id = (params[:id])
    @articles = Article.all
    @article = Article.find(params[:id])
    @categolies = Category.all
    @category = Article.maximum("category_id")
    @note = Note.find_by_sql(['SELECT notes.* FROM notes INNER JOIN articles ON notes.comment_id = comment_id AND notes.article_id = articles.id WHERE notes.comment_id = '+id])
  end
 
  def new
    pp '★★★method:::::::articles/new'
    @category = Article.maximum("category_id")
    @article = Article.new
    @cate = Category.new
  end
 
  def edit
    pp '★★★method:::::::articles/edit'
    @category = Article.maximum("category_id")
    @article = Article.find(params[:id])
    @cate = Category.new
  end
  # @cate = Category.find(@article.category_id)
  # @cate = @article.joins(:category).where('articles.category_id = categories.id')
#   @cate = find_by_sql(["SELECT * FROM articles,categories WHERE articles.category_id='8' AND articles.category_id = categories.id"])
#   @test = User.all.includes(:attendance_news).where(attendance_news: {superior_id: params[:id], superior_chk_kbn: '1'})
#   @cate = Article.all.includes(:categories).where(articles: {category_id: params[:id], superior_chk_kbn: '1'})
# Person
# .select('people.id, people.name, comments.text')
# .joins(:comments)
# .where('comments.created_at > ?', 1.week.ago)

  def create
    pp '★★★method:::::::articles/create'
    @category = Article.maximum("category_id")
    @article = Article.create(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end
 
  def update
    pp '★★★method:::::::articles/update'
    @category = Article.maximum("category_id")
    @cate = Category.find(params[:article][:category_id])
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'new'
    end
  end


  def destroy
    pp '★★★method:::::::articles/destroy'
    @article = Article.find(params[:id])
    @category = Article.maximum("category_id")
    @article.destroy
 
    redirect_to articles_path
  end
 
  private
    def article_params
      params.require(:article).permit(:title, :text, :aurl, :category_id)
    end

    private
    def cate_params
      params.require(:article).permit(:category_id)
    end

    private
    def category_params
      params.require(:categories).permit(:name)
    end
end