class Match < ApplicationRecord
  enum :stage, [:not_finished, :finished]
  has_many :pools
  has_many :users
  
  belongs_to :home_team, class_name: "Team", foreign_key: "home_team_id"
  belongs_to :visitor_team, class_name: "Team", foreign_key: "visitor_team_id"

  after_update :calculate

  def points
    if (match.home_team_score == match.visitor_team_score && home_team_score == visitor_team_score)
      points = 1
    elsif (match.home_team_score > match.visitor_team_score && home_team_score > visitor_team_score)
      points = 2
    elsif (match.visitor_team_score > match.home_team_score && visitor_team_score > match.visitor_team_score)
      points = 2  
    elsif (match.home_team_score == home_team_score  && match.visitor_team_score == visitor_team_score)
      points = 3 
    else
      points = 0    
    end
  end

  def calculate 
    if match.stage == 1
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
end

  # Match.users
  # Pool.where(match_id: 1)
  #   if (stage == 1)
  #     User.all.each do |user|
  #       points = 0
  #       if (match.home_team_score == match.visitor_team_score && home_team_score == visitor_team_score)
  #         points = 1
  #       elsif (match.home_team_score > match.visitor_team_score && home_team_score > visitor_team_score)
  #         points = 2
  #       elsif (match.visitor_team_score > match.home_team_score && visitor_team_score > match.visitor_team_score)
  #         points = 2  
  #       elsif (match.home_team_score == home_team_score  && match.visitor_team_score == visitor_team_score)
  #         points = 3 
  #       else
  #         points = 0    
  #       end
  #       user.points += points
  #       user.save
  #     end
  #   else 
  #     return
  #   end
  # end

#  1. match after_update
#  2. stage = 1
#  3. all pools where match_id = updated match_id
#  4. for each user calculate and add points

# User.all.each do |user|
#   result = 0
#   if (match.home_team_score == match.visitor_team_score && home_team_score == visitor_team_score)
#     result = 1
#   elsif (match.home_team_score > match.visitor_team_score && home_team_score > visitor_team_score)
#     result = 2
#   elsif (match.visitor_team_score > match.home_team_score && visitor_team_score > match.visitor_team_score)
#     result = 2  
#   elsif (match.home_team_score == home_team_score  && match.visitor_team_score == visitor_team_score)
#     result = 3 
#   else
#     result = 0    
#   end
#   user.points += result
#   user.save
# end
