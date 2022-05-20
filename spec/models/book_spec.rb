# frozen_string_literal: true
require 'rails_helper'

describe "Bookモデルのテスト" do
  before do
    @user = FactoryBot.create(:user)
  end

  context "有効な投稿内容である" do
    it "投稿者の投稿した本である" do
      expect(FactoryBot.build(:book, user_id: @user.id)).to be_valid
    end
  end

    context "無効な投稿内容である" do
    it "投稿者の投稿した本ではない" do
      expect(FactoryBot.build(:book, user_id: @user.id + 1)).not_to be_valid
    end
  end

end
