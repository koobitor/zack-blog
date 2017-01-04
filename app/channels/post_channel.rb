class PostChannel < ApplicationCable::Channel
  def subscribed
    post = Post.find(params[:id].split('/').last)
    stream_for post if post
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
