class PointsMailer < ApplicationMailer
  default from: 'bets@gmail.com'
  
  def send_email
    @points = params[:points]
    @mail = params[:email]

    @user = User.first

    mail(to: @user.email, subject: 'Points')
  end
end
