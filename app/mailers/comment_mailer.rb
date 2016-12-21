class CommentMailer < ApplicationMailer
  def creation(user, post, comment)
    @user = user
    @comment = comment
    @post = post
    mail to: @user.email, subject: "#{post.title} has a new comment."
  end
end
