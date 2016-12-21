class Post < ApplicationRecord
  validates :title, presence: true

  has_many :comments
  has_many :commenters, through: :comments, source: :user

  has_many :taggings
  has_many :tags, through: :taggings
end
