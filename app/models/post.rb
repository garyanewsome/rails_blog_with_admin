class Post < ActiveRecord::Base

  POST_STATUSES = [
    STATUS_PUBLISHED = 'published',
    STATUS_UNPUBLISHED = 'unpublished'
  ]

  scope :published, -> { where(published: Post::STATUS_PUBLISHED) }
end
