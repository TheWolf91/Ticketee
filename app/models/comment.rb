class Comment < ApplicationRecord
  belongs_to :ticket
  belongs_to :author, class_name: "User"
  delegate :project, to: :ticket
  scope :persisted, lambda { where.not(id: nil) }

  validates :text, presence: true
end
