require "test_helper"

class PointMailerTest < ActionMailer::TestCase
  def send
    PointsMailer.with(user: User.first).send
  end
  # test "the truth" do
  #   assert true
  # end
end
