class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  after_create :send_email_to_commenters

  private def send_email_to_commenters
    post.commenters.where.not(id: user.id).uniq.each do |u|
      CommentMailer.creation(u, post, self).deliver_later
    end
  end
end
