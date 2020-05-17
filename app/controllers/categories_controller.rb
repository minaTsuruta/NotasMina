class CategoriesController < ApplicationController
    
  def show
    pp '♪♪♪method:::::::Categories/show'
    @categories = Category.all
    # @category = Article.find_by_sql(['SELECT category_id FROM articles order by category_id DESC LIMIT 1'])
    @category = Article.maximum("category_id")
    @cate = Category.new
    render 'action'
  end

  def new
    pp '♪♪♪method:::::::Categories/new'
    @categories = Category.all
    @cate = Category.new
    @category = Article.maximum("category_id")
    render 'action'
  end
 
  def edit
    pp '♪♪♪method:::::::Categories/edit'
    @cate = Category.find(params[:id])
    @categories = Category.all
    @category = Article.maximum("category_id")
    render 'action'
  end
 
  def create
    pp '♪♪♪method:::::::Categories/create'
    @cate = Category.new(category_params)
    @categories = Category.all
    @category = Article.maximum("category_id")
 
    if @cate.save
      render 'action'
    else
      render 'action'
    end
  end
 
  def update
    pp '♪♪♪method:::::::Categories/update'
    @cate = Category.find(params[:id])
    @category = Article.maximum("category_id")
 
    if @cate.update(category_params)
      redirect_to @cate
    else
      render 'action'
    end
  end

  def destroy
    pp '♪♪♪method:::::::Categories/destroy'
    @cate = Category.find(params[:id])
    @category = Article.maximum("category_id")
    @cate.destroy
 
    redirect_to new_category_path
  end
 
  private
  def category_params
    params.require(:category).permit(:name)
  end
end