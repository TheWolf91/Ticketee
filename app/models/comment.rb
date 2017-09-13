class Comment < ApplicationRecord
  belongs_to :state # optional: true to set "belongs_to default" to false https://stackoverflow.com/questions/38983666/validation-failed-class-must-exist
  belongs_to :ticket
  belongs_to :author, class_name: "User"
  belongs_to :previous_state, class_name: "State"
  delegate :project, to: :ticket
  scope :persisted, lambda { where.not(id: nil) }

  validates :text, presence: true
  before_create :set_previous_state
  after_create :set_ticket_state

  private

  def set_previous_state
    self.previous_state = ticket.state
  end

  def set_ticket_state
    ticket.state = state
    ticket.save!
  end

end
