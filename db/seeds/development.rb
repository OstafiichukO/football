require 'faker'

32.times do |index| 
  team = Team.create(name: Faker::Sports::Football.team) 
end