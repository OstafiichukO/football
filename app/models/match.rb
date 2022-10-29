class Match < ApplicationRecord
  validates :date, presence: true
  enum status: {
    not_started: :not_started,
    continues: :continues,
    finished: :finished,
  }

  belongs_to :home_team, class_name: "Team", foreign_key: "home_team_id"
  belongs_to :visitor_team, class_name: "Team", foreign_key: "visitor_team_id"
  has_many :pools
  before_create :set_defaults

  def set_defaults
    unless(home_team_score)
      home_team_score = 0
    end
    unless(visitor_team_score)
      visitor_team_score = 0
    end
  end
  
end