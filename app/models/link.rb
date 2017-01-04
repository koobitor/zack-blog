class Link < ApplicationRecord
  has_and_belongs_to_many :posts

  validates :url, uniqueness: true

  mount_uploader :screenshot, ScreenshotUploader

  after_commit(
    -> { ScreenshotJob.perform_later(self) },
    on: :create
  )
end
