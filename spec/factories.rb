require 'faker'
r = Random.new

FactoryBot.define do
  factory :match do    
    match_date { Faker::Date.between(from: 14.days.ago, to: Date.today) }
    home_team_id { r.rand(1..8) }
    visitor_team_id { r.rand(9..16) }
  end
end