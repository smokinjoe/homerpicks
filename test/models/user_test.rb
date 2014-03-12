require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "is admin" do
    assert users(:admin).is_admin?
  end
end
