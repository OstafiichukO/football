require 'faker'

Team.destroy_all
r = Random.new

32.times do |index| 
  team = Team.create(name: Faker::Sports::Football.unique.team) 
end

31.times do |index|
  match = Match.create( match_date: rand(DateTime.now..30.days.from_now.to_datetime), stage: 'finished', home_team__id: r.rand(54..74), home_team_score: r.rand(0..7), visitor_team__id: r.rand(54..74), visitor_team_score: r.rand(0..7))
end
