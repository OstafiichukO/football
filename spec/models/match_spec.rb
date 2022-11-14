require 'rails_helper'
r = Random.new

RSpec.describe Match, type: :model do
  subject { described_class.new(match_date: Faker::Date.between(from: 14.days.ago, to: Date.today), home_team_id: r.rand(0..8), visitor_team_id: r.rand(9..16)) }

  it "is valid with valid attributes" do
      expect(subject).to be_valid
  end
  it "is not valid without a match_date" do
    subject.match_date = nil
    expect(subject).to_not be_valid
  end
  it "is not valid with a string match_date" do
    subject.match_date = 'today'
    expect(subject).to_not be_valid
  end
  it "is not valid with a not valid format match_date" do
    subject.match_date = 01122022
    expect(subject).to_not be_valid
  end
  it "is not valid without one of a team" do
    subject.home_team_id = nil
    expect(subject).to_not be_valid
  end
  it "is not valid with same teams" do
    subject.home_team_id = 1
    subject.visitor_team_id = 1
    expect(subject).to_not be_valid
  end
end
