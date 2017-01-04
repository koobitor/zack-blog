class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.where(id: params[:post_id]).first

    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    @comment.save
    PostChannel.broadcast_to(@post, @comment)

    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
