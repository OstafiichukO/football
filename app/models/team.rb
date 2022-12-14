class Team < ApplicationRecord
  validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "Only letters allowed"}

  has_many :matches_home_team, class_name: 'Match', foreign_key: 'home_team_id'
  has_many :matches_visitor_team, class_name: 'Match', foreign_key: 'visitor_team_id'

  has_one_attached :logo
  has_one_attached :players
end
