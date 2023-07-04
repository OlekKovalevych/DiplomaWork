class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'

  validates :body, presence: true
  validates :title, presence: true
  validates :author_id, presence: true
end
