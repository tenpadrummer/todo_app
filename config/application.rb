require_relative 'boot'

require 'rails/all'
Bundler.require(*Rails.groups)

module TodoApp
  class Application < Rails::Application
    config.load_defaults 6.0
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.action_view.field_error_proc = proc { |html_tag, _instance| html_tag }
    config.generators do |g|
      g.test_framework :rspec,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false
      g.stylesheets false
      g.javascripts false
      g.test_framework false
    end
  end
end
