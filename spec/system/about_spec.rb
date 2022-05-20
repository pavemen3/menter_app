# frozen_string_literal: true
require 'rails_helper'

describe "投稿のテスト" do
  describe "About画面(about_path)のテスト" do
    before do
      visit about_path
    end

    context "表示の確認" do
      it "About画面(about_path)に「Homes#about」が表示されているか" do
        expect(page).to have_content('Homes#about')
      end
    end
  end
end
