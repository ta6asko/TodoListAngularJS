require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TodoListAngularjs
  class Application < Rails::Application
    config.generators do |g|
      g.template_engine :haml
      g.test_framework :rspec, fixures: true, views: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end

    config.assets.enabled = false
  end
end
