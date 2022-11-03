# Preview all emails at http://localhost:3000/rails/mailers/points_sending_mailer
class PointsMailerPreview < ActionMailer::Preview
  def send
    PointsMailer.with(user: User.first).send
  end
end
