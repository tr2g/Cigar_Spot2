class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user
    @comment.save
    redirect_to comment_path
  end

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
  end


  private
    def comment_params
      params.require(:comment).permit(:body, :star)
    end

end
