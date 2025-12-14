require "test_helper"

class UserTest < ActiveSupport::TestCase
  # やりたいこと：passwordカラムを5文字以下で入力させない
  test "password should be too short" do
    user = User.new(email: "unique_email@example.com", password: "aaa")
    # user.valid?  が true であることを検証する
    assert_not user.valid? 
  end
end
