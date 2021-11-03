# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  allow_password_change  :boolean          default(FALSE)
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  image                  :string
#  name                   :string
#  provider               :string           default("email"), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  tokens                 :json
#  uid                    :string           default(""), not null
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_uid_and_provider      (uid,provider) UNIQUE
#
require "rails_helper"

RSpec.describe User, type: :model do
  context "nameを指定した時" do
    it "userが作られる" do
      user = User.new(name: "pochi", email: "pochi@example.com", password: "pochitama")
      expect(user.valid?).to eq true
    end
  end

  context "nameを指定していない時" do
    it "user作成に失敗する" do
      user = User.new(name: "nil", email: "pochi@example.com", password: "pochi")
      expect(user.valid?).to eq false
    end
  end

  context "同じnameとemailが存在しない時" do
    it "userが作れれる" do
      user = User.new(name: "pochi", email: "pochi", password: "pochitama")
      expect(user).to be_invalid
    end
  end

  context "同じnameとemailが存在している時" do
    it "user作成に失敗する" do
      # User.create!(name:"pochi",email:"pochi",password:"pochi")
      user = User.new(name: "pochi", email: "pochi@example.com", password: "pochi")
      expect(user).to be_invalid
    end
  end
end
