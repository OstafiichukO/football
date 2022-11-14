require 'rails_helper'
r = Random.new

RSpec.describe Pool, type: :model do
  subject { described_class.new(home_team_score: r.rand(0..12), visitor_team_score: r.rand(0..12), match_id: r.rand(0..12), user_id: 1) }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    it "is valid with prediction 0-0" do
      subject.home_team_score = 0
      subject.visitor_team_score = 0
      expect(subject).to be_valid
    end
    it "is not valid with prediction over 99" do
      subject.home_team_score = 100
      expect(subject).to_not be_valid
    end
    it "is not valid with prediction nil-nil" do
      subject.home_team_score = nil
      subject.visitor_team_score = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a match" do
      subject.match_id = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a match that not exist" do
      subject.match_id = 999
      expect(subject).to_not be_valid
    end
end