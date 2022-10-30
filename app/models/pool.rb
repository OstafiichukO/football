class Pool < ApplicationRecord
  belongs_to :match 
  belongs_to :user 
  has_one :home_team, through: :match
  has_one :visitor_team, through: :match

  validates_numericality_of :home_team_score, :message => "Invalid number"
  validates_numericality_of :visitor_team_score, :message => "Invalid number"
  validates_inclusion_of    :home_team_score, :in => 0..99, :message => "Invalid number"
  validates_inclusion_of    :visitor_team_score, :in => 0..99, :message => "Invalid number"
end
