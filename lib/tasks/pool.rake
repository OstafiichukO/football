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