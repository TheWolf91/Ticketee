class Comment < ApplicationRecord
  belongs_to :state, optional: true # optional: true, because in Rails 5 that value must exist https://stackoverflow.com/questions/38983666/validation-failed-class-must-exist
  belongs_to :ticket
  belongs_to :author, class_name: "User"
  delegate :project, to: :ticket
  scope :persisted, lambda { where.not(id: nil) }

  validates :text, presence: true
  after_create :set_ticket_state

  private

  def set_ticket_state
    ticket.state = state
    ticket.save!
  end
end
