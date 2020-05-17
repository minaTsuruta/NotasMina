require "pp"
class CommentsController < ApplicationController

  http_basic_authenticate_with name: "mina", password: "1029", only: :destroy
  
  def edit
    pp "☆☆method:::::::comments/edit"
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end

  def create
    pp "☆☆☆method:::::::comments/create"
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end
  
  def update
    pp "☆☆method:::::::comments/update"
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    pp "☆☆method:::::::comments/destroy"
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
  
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :curl)
    end
end