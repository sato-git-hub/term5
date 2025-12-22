require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "password should be too short" do
    user = User.new(email: "unique_email@example.com", password: "aaa")
    assert_not user.valid?
  end
end
