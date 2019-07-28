require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context "accountを指定しているとき" do
    it "ユーザーが作られる" do
      # binding.pry
      user = create(:user)
      expect(user).to be_valid
    end
  end

  context "accountを指定していないとき" do
    it "エラーする" do
      user = build(:user, account:nil)
      user.valid?
      # binding.pry
      expect(user.errors.messages[:account]).to include "can't be blank"
    end
  end

  context "同名のaccountが存在するとき" do
    before do
      User.create!(name: "chinju", account: "chinju", email: "chinju@example.com")
    end

    it "エラーする" do
      user = User.new(name: "chinju", account: "chinju", email: "chinju@example.com")
      user.valid?
      expect(user.errors.messages[:account]).to include "has already been taken"
    end
  end
end
