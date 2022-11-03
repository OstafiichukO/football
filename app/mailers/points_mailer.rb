class PointsMailer < ApplicationMailer
  default from: 'bets@gmail.com'

  def welcome
    @email = params[:email]
    mail(to: @user.email, subject: 'Welcome')
  end
  
  def send
    @points = params[:points]
    @email = params[:email]
    mail(to: @email, subject: 'Points')
  end
end
