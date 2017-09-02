class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :body, presence: true

  has_closure_tree order: "created_at DESC"
end
