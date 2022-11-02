class CalculatePointsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    users = User.all
    users.each do |user|
      points = 0
      user_pools = Pool.where(user: user)
      user_pools.each do |pool|
        points = points + pool.points
      end
      user.points = points
      user.save
    end
  end

end