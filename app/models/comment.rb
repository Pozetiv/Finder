class Comment < ApplicationRecord
  default_scope { order(created_at: :desc) }

  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates :body, presence: true, length: { minimum: 2, maximum: 200 }
end
