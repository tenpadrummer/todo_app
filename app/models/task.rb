class Task < ApplicationRecord
  belongs_to :user
  belongs_to :project

  with_options presence: true do |e|
    e.validates :title
    e.validates :content
    e.validates :deadline
  end
  validates_inclusion_of :finished, in: [true, false]
  validate :correct_date?

  def correct_date?
    if self.deadline.to_time < Time.now
      errors.add(:deadline, "Invalid.")
    end
  end
end