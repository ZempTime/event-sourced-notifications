require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "i set up my fixtures correctly" do
    assert users(:hairy_dog_man).comments.count > 0
  end
end
