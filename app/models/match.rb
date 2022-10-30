class Match < ApplicationRecord
  # validates :date, presence: true
  enum stage: {
    not_started: :not_started,
    continues: :continues,
    finished: :finished,
  }
  has_many :pools
  belongs_to :home_team, class_name: "Team", foreign_key: "home_team_id"
  belongs_to :visitor_team, class_name: "Team", foreign_key: "visitor_team_id"
  

end