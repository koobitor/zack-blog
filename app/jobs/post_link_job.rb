class PostLinkJob < ApplicationJob
  queue_as :default

  def perform(post)
    links = URI.extract(post.body)

    post.links = links.map do |link|
      Link.where(url: link).first_or_create!
    end
  end
end
