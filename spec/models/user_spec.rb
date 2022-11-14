require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(email: Faker::Internet.email, password: Faker::Internet.password) }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    it "is not valid without a email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end
    it "is not valid with empty password" do
      subject.password = ""
      expect(subject).to_not be_valid
    end
    it "is not valid with empty email" do
      subject.email = ""
      expect(subject).to_not be_valid
    end
end