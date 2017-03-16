require 'rails_helper'

RSpec.describe Task, type: :model do
  context "Valid task" do
    it "saves a valid task" do
      expect(build(:task, user:build(:user))).to be_valid
    end
    it "defaults completed to false" do
      expect(build(:task).completed).to eq(false)
    end
  end

  context "Invalid task" do
    it "requires content" do
      expect(build(:task, content:"")).to be_invalid
    end
    it "requires due_date" do
        expect(build(:task, due_date:"")).to be_invalid
    end
    it "requires user" do
        expect(build(:task, user:nil)).to be_invalid
    end
  end
end
