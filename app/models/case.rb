class Case < ApplicationRecord
  enum status: { waiting: 0, approved: 1, active: 2, complete: 3}
  validate :status_transition_allowed

  attr_accessor :user_id

  def transitionable_statuses(status)
    current = self.class.statuses[status]

    surroundings = [current - 1, current + 1]
      .select { |n| n.between?(0, self.class.statuses.length - 1)}

    self.class.statuses.select { |status, integer| surroundings.include?(integer)}
  end

  private
    def status_transition_allowed
      return if !status_changed?

      unless transitionable_statuses(status_was).include?(status)
        errors.add(:status, :invalid_transition, message: "status '#{status_was}' can only transition to: '#{transitionable_statuses(status_was).keys.join(",")}'")
      end
    end
end
