class Match < ApplicationRecord
  validates :date, presence: true
  enum status: {
    not_started: :not_started,
    continues: :continues,
    finished: :finished,
  }
end

belongs_to :first_team, class_name: "Team", foreign_key: "first_team_id"
belongs_to :second_team, class_name: "Team", foreign_key: "second_team_id"
has_many :predictions
before_create :set_defaults