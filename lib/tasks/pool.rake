desc "determine the winner"
task :winner => :environment do
  puts "----------------------"
  puts "Winner is ..."
  puts User.where(points: User.maximum("points")).pluck(:email)
  puts "----------------------"
end

desc "total pools"
task :pool => :environment do
  puts "----------------------"
  puts "All pools are made:"
  puts Pool.count(:id)
  puts "----------------------"
end

desc "The most goals per match"
task :top_goals => :environment do
  puts "----------------------"
  puts "The most goals per match:"
  puts "At home: #{Match.maximum("home_team_score")}"
  puts "At visit: #{Match.maximum("visitor_team_score")}"
  puts "----------------------"
end

# desc "update_stage"
# task :update_stage => :environment do
#   puts Match.first.status
#   # Match.all.each do |match|
#   #   match.update_column(match.stage, 0)
#   # end
# end

desc "info"
task :info => :environment do
  # puts Match.where(Match.stage == 0)
  pools = Pool.where(match_id: 1)
  puts pools.methods
  # puts Match.where(stage: :not_finished).pluck(:id)
end

desc "reset points in database"
task :reset_points => :environment do

  users = User.all
  users.each do |user|
    user.update_column( :points, 0 )
  end
  # matches = Match.all
  # matches.each do |match|
  #   match.update_column( :stage, :preparation )
  # end
end

desc "reset stage in database"
task :reset_stage => :environment do
  matches = Match.all
  matches.each do |match|
    match.update_column( :stage, :preparation )
  end
end

desc "reset points in database"
task :reset_score => :environment do
  # user = User.find_by(id: 1)
  # user.update_column( :points, 'bryan.bartell@breitenberg.org')
  matches = Match.all
  matches.each do |match|
    match.update_column( :home_team_score, 0 )
  end
  matches.each do |match|
    match.update_column( :visitor_team_score, 0 )
  end
end

desc "reset points, stage, score in database"
task :reset_all => :environment do
  users = User.all
  matches = Match.all

  users.each do |user|
    user.update_column( :points, 0 )
  end

  matches.each do |match|
    match.update_column( :home_team_score, 0 )
  end

  matches.each do |match|
    match.update_column( :visitor_team_score, 0 )
  end
  
  matches.each do |match|
    match.update_column( :stage, :preparation )
  end
end

desc "reset points in database"
task :add_points => :environment do
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