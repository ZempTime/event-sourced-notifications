require 'test_helper'

class CaseTest < ActiveSupport::TestCase
  test "transitionable_statuses returns statuses around given status" do
    expected_statuses = Case.statuses.select { |status| ["waiting", "active"].include?(status) }
    assert_equal expected_statuses, Case.new.transitionable_statuses("approved")
  end

  test "transitional_statuses won't return before first status" do
    expected_statuses = Case.statuses.select { |status| ["approved"].include?(status) }
    assert_equal expected_statuses, Case.new.transitionable_statuses("waiting")
  end

  test "transitional_statuses won't return after last status" do
    expected_statuses = Case.statuses.select { |status| ["active"].include?(status) }
    assert_equal expected_statuses, Case.new.transitionable_statuses("complete")
  end

  test "status_transition_allowed" do
    terrible_case = cases(:terrible_case)
    terrible_case.update(status: "complete")
    assert terrible_case.errors[:status].include? "status 'waiting' can only transition to: 'approved'"
  end
end
