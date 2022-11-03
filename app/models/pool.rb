class Pool < ApplicationRecord
  belongs_to :match 
  belongs_to :user 
  has_one :home_team, through: :match
  has_one :visitor_team, through: :match

  validates_numericality_of :home_team_score, :message => "Invalid number"
  validates_numericality_of :visitor_team_score, :message => "Invalid number"
  validates_inclusion_of    :home_team_score, :in => 0..99, :message => "Invalid number"
  validates_inclusion_of    :visitor_team_score, :in => 0..99, :message => "Invalid number"

  def points
    if (match.home_team_score == match.visitor_team_score && home_team_score == visitor_team_score)
      1
    elsif (match.home_team_score > match.visitor_team_score && home_team_score > visitor_team_score)
      2
    elsif (match.visitor_team_score > match.home_team_score && visitor_team_score > match.visitor_team_score)
      2  
    elsif (match.home_team_score == home_team_score && match.visitor_team_score == visitor_team_score)
      3 
    else
      0    
    end
  end
end