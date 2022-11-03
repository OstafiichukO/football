class PointsMailer < ApplicationMailer
  default from: 'bets@gmail.com'
  
  def send_email
    @user = params[:user]
    @points = params[:points]
    # @email = params[:email]
    mail(to: @user.email, subject: 'Points')
  end
end
