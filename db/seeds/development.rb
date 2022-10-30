require 'faker'

# Match.destroy_all
# Team.destroy_all

r = Random.new

# 16.times do |index| 
#   team = Team.create(name: Faker::Sports::Football.unique.team) 
# end

# 15.times do |index|
#   match = Match.create(match_date: Faker::Date.between(from: 14.days.ago, to: Date.today), stage: 'finished', home_team_id: r.rand(1..16), home_team_score: r.rand(0..12), visitor_team_id: r.rand(1..16), visitor_team_score: r.rand(0..12))
# end
# match = Match.create(match_date: Faker::Date.today, stage: 'finished', home_team_id: 1, visitor_team_id: 2 )
# 5.times do |index|
#   user = User.create(email: Faker::Internet.email, encrypted_password: Faker::Internet.password(min_length: 8), points: 0)
# end
# Pool.destroy_all

# 15.times do |index|
#   pool = Pool.create(home_team_score: r.rand(0..12), visitor_team_score: r.rand(0..12), match_id: r.rand(1..15), user_id: r.rand(1..5))
# end

pool = Pool.create(home_team_score: 6, visitor_team_score: 10, match_id: 1, user_id: 1)