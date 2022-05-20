# frozen_string_literal: true
require 'rails_helper'


RSpec.describe User, type: :system do
  let(:user) { create(:user) }

  describe 'User CRUD' do
    describe 'ログイン前' do
      before do
        visit root_path
      end

      describe 'ユーザー新規登録' do
        context 'フォームの入力値が正常' do
          it 'ユーザーの新規作成が成功' do
            @user = FactoryBot.build(:user, email: 'test2@example.com')
            # ユーザー新規登録画面へ遷移
            visit new_user_registration_path
            # NameテキストフィールドにTaroと入力
            fill_in 'Name', with: @user.name
            # Emailテキストフィールドにtest@example.comと入力
            fill_in 'Email', with: @user.email
            # passwordテキストフィールドにpasswordと入力
            fill_in 'Password', with: @user.password
            # passwordconfirmationテキストフィールドにpasswordと入力
            fill_in 'Password confirmation', with: @user.password
            # SignUpと記述のあるsubmitをクリックする
            click_button 'Sign up'
            # マイページへ遷移することを期待する
            expect(current_path).to eq "/users/1"
            # 遷移されたページに'User was successfully created.'の文字列があることを期待する
            # expect(page).to have_content 'User was successfully created.'
          end
        end
        context 'メールアドレス未記入' do

        end
        context '登録済メールアドレス' do

        end
      end
    end
    describe 'ログイン後' do
      describe 'ユーザー編集'
        context 'フォームの入力値が正常' do

        end
        context 'メールアドレス未記入' do

        end
    end

  end
end




# describe "ユーザーのテスト" do
#   let!(:user) { create(:user) }

#   describe "ログインしていないときのトップ画面(root_path)のテスト" do
#     before do
#       visit root_path
#     end

#     context "表示の確認" do
#       it "ログイン画面が表示されているか" do
#         expect(page).to have_content('Log in')
#       end

#       it "current_urlが '/users/sign_in' であるか" do
#         expect(current_url).to eq "http://www.example.com/"
#       end

#       it "root_pathが '/' であるか" do
#         expect(current_path).to eq "/"
#       end
#     end
#   end

#   describe "ログインしているときのトップ画面(root_path)のテスト" do
#     before do
#       sign_in user
#       visit root_path
#     end

#     context "表示の確認" do
#       it "マイページが表示されているか" do
#         expect(current_path).to eq "/users/#{user.id}"
#       end
#     end
#   end
# end
