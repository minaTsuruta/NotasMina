require "pp"
class NotesController < ApplicationController
    
    def edit
        pp "▶︎▶︎method:::::::::Notes/edit"
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:comment_id])
        @note = @comment.notes.find(params[:id])
        pp @note
    end
      
    def new
        pp '▶︎▶︎method::::::::::Notes/new'
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:comment_id])
        @note = Note.new
    end
    
    def create
        pp "▶︎▶︎method:::::::::Notes/create"
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:comment_id])
        @note = Note.new(note_params)
        @note.article_id = (params[:article_id])
        @note.comment_id = (params[:comment_id])
        @note.save
        redirect_to article_path(@article)
    end

    def update
        pp "▶︎▶︎method:::::::::Notes/update"
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:comment_id])
        @note = @comment.notes.find(params[:id])
        if @note.update(note_params)
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end
    
    def destroy
        pp "▶︎▶︎method:::::::::Notes/destroy"
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:comment_id])
        @note = @comment.notes.find(params[:id])
        @note.destroy
        redirect_to article_path(@article)
    end
      
    private def note_params
        params.require(:note).permit(:note, :detail, :status, :report, :nurl)
    end
    
end

