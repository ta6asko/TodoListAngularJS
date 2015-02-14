ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'shoulda/matchers'
require 'devise'
require 'capybara/rspec'
require 'spec_helper'

include Warden::Test::Helpers


Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

# Capybara.register_driver :selenium_chrome do |app|
#   Capybara::Selenium::Driver.new(app, :browser => :chrome)
# end

Capybara.javascript_driver = :selenium
Capybara.current_driver = :selenium
Capybara.default_host = 'http://localhost:3000'
OmniAuth.config.test_mode = true
OmniAuth.config.add_mock(:facebook, {
  :provider => 'facebook', 
  :info => { 
    :urls => { 
      :Facebook => 'https://www.facebook.com/' 
      },
    }, 
  :extra => { 
    :raw_info => { 
      :name => Faker::Name.name,
      :username => Faker::Name.name,
      :email => Faker::Internet.email
    }
  }, 
})

RSpec.configure do |config|

  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!

  config.include Devise::TestHelpers, :type => :controller
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  # config.before(:each) do
  #   DatabaseCleaner.strategy = :transaction
  # end

  # config.before(:each, :js => true) do
  #   DatabaseCleaner.strategy = :truncation
  # end

  # config.before(:each) do
  #   DatabaseCleaner.start
  # end

  # config.after(:each) do
  #   DatabaseCleaner.clean
  # end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  def sign_in(user=nil, scope=:user)
    user ||= create(scope)
    login_as user, scope: scope
  end
end



