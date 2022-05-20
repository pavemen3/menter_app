# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include FactoryBot::Syntax::Methods
  config.include Devise::Test::IntegrationHelpers, type: :system #sign_inヘルパーを提供してくれます
  config.before(:each, type: :system) do
    driven_by :rack_test
  end
  # RSpecの実行前に一度、実行
  config.before(:suite) do
    # DBを綺麗にする手段を指定、トランザクションを張ってrollbackするように指定
    DatabaseCleaner.strategy = :transaction
    # truncate table文を実行し、レコードを消す
    DatabaseCleaner.clean_with(:truncation)
  end

  # exampleが始まるごとに実行
  config.before(:each) do
    # strategyがtransactionなので、トランザクションを張る
    DatabaseCleaner.start
  end

  # exampleが終わるごとに実行
  config.after(:each) do
    # strategyがtransactionなので、rollbackする
    DatabaseCleaner.clean
  end
end
