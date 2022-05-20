# frozen_string_literal: true
require 'rails_helper'


# describe "投稿のテスト" do
#   let!(:user) { create(:user) }

#   describe "投稿画面のテスト" do
#     before do
#       sign_in user
#       visit new_book_path
#     end
#     context "表示の確認" do
#       it "新規登録画面のURLが'/books/new'であるか" do
#         expect(current_path).to eq "/books/new"
#       end

#       it "投稿ボタンが表示されているか" do
#         expect(page).to have_content("投稿")
#       end
#     end

#     context "投稿処理のテスト" do
#       it "投稿後のリダイレクト先は正しいか" do
#         FactoryBot.create(:book, user_id: user.id)
#         sleep 0.1
#         expect(response).to redirect_to books_path
#       end
#     end
#   end
# end




  # describe：一覧画面のテスト
  #   before：一覧画面への遷移
  #   context ：一覧の表示とリンクの確認
  #     it：一覧表示画面に投稿されたもの表示されているか
  #       テストコード

  # describe：詳細画面のテスト
  #   before：詳細画面への遷移
  #   context：表示のテスト
  #     it：削除リンクが存在しているか
  #       テストコード
  #     it：編集リンクが存在しているか
  #   context：リンクの遷移先の確認
  #     it：編集の遷移先は編集画面か
  #       テストコード
  #   context：list削除のテスト
  #     it：listの削除
  #       テストコード

  # describe：編集画面のテスト
  #   before：編集画面への遷移
  #   context：表示の確認
  #     it：編集前のタイトルと本文がフォームに表示(セット)されている
  #       テストコード
  #     it：保存ボタンが表示される
  #   context：更新処理に関するテスト
  #     it：更新後のリダイレクト先は正しいか
  #       テストコード
