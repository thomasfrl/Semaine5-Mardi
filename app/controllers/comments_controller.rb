class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create

  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end

  def update
    @comment = Comment.find(params[:id])
    id = @comment.commentable_id
    unless @comment.commentable_type == "Gossip"
      @comment_parent = Comment.find(id)
      id = @comment_parent.commentable_id
    end

    @comment.content = params[:content]
    @comment.save # essaie de sauvegarder en base @gossip
    redirect_to "/gossips/#{id}"

  end

  def edit
    @comment = Comment.find(params[:id])
  end
end