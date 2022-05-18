# frozen_string_literal: true
require 'rails_helper'

describe "Bookモデルのテスト" do
  it "有効な投稿内容である" do
    expect(FactoryBot.build(:book)).to be_valid
  end
end
