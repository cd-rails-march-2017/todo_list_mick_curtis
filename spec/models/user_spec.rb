require 'rails_helper'

RSpec.describe User, type: :model do
  context "Valid user" do
    it "saves a valid user" do
      expect(build(:user)).to be_valid
    end
  end

  context "Invalid user" do
    it "requires username" do
      expect(build(:user, username:"")).to be_invalid
    end
    it "requires password" do
        expect(build(:user, password:"")).to be_invalid
    end
    it "doesn't allow a duplicate username" do
      create(:user)
      expect(build(:user)).to be_invalid
    end
  end
end
