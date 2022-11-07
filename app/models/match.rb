class Match < ApplicationRecord
  enum :stage, [:preparation, :finished]
  has_many :pools
  has_many :users
  
  belongs_to :home_team, class_name: "Team", foreign_key: "home_team_id"
  belongs_to :visitor_team, class_name: "Team", foreign_key: "visitor_team_id"

  # after_update :CalculatePointsJob

  def points
    if (match.home_team_score == match.visitor_team_score && home_team_score == visitor_team_score)
      1
    elsif (match.home_team_score > match.visitor_team_score && home_team_score > visitor_team_score)
      2
    elsif (match.visitor_team_score > match.home_team_score && visitor_team_score > match.visitor_team_score)
      2  
    elsif (match.home_team_score == home_team_score  && match.visitor_team_score == visitor_team_score)
      3 
    else
      0    
    end
  end
end