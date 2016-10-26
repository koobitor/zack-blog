class CommentsController < ApplicationController
  def create
    @post = Post.where(id: params[:post_id]).first

    @comment = @post.comments.build(comment_params)
    @comment.save
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
