class Post < ApplicationRecord
  validates :title, presence: true

  has_many :comments
  has_many :commenters, through: :comments, source: :user

  has_many :taggings
  has_many :tags, through: :taggings

  has_and_belongs_to_many :links

  after_commit :scrape_link_screenshot

  def scrape_link_screenshot
    LinkScreenshotJob.perform_later(self)
  end
end
