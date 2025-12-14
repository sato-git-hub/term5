require "test_helper"

class DocumentTest < ActiveSupport::TestCase
  test "title should be present" do
    user = User.create!(email: "a@test.com", password: "password")
    document = user.documents.build(title: "")

    assert_not document.valid?
  end
end
