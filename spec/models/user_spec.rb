require "rails_helper"

RSpec.describe User, type: :model do
  context "nameを指定した時" do
    it "userが作られる" do
      user = User.new(name: "pochi", email: "pochi@example.com", password: "pochi")
      expect(user.valid?).to eq false
    end
  end

  context "nameを指定していない時" do
    it "user作成に失敗する" do
      user = User.new(name: "nil", email: "pochi@example.com", password: "pochi")
      expect(user.invalid?).to eq true
    end
  end

  context "同じnameとemailが存在しない時" do
    it "userが作れれる" do
      user = User.new(name: "pochi", email: "pochi", password: "pochi")
      expect(user).to be_invalid
    end
  end

  context "同じnameとemailが存在している時" do
    it "user作成に失敗する" do
      # binding.pry
      # User.create!(name:"pochi",email:"pochi",password:"pochi")
      user = User.new(name: "pochi", email: "pochi@example.com", password: "pochi")
      expect(user).to be_invalid
    end
  end
end
