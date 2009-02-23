ENV['RAILS_ENV'] ||= 'development'
RAILS_GEM_VERSION = '2.1.0' unless defined? RAILS_GEM_VERSION
require File.join(File.dirname(__FILE__), 'boot')
Rails::Initializer.run do |config|
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]
  # config.load_paths += %W( #{RAILS_ROOT}/extras )
  # config.log_level = :debug
  config.time_zone = 'UTC'
  config.action_controller.session_store = :active_record_store
  # config.active_record.schema_format = :sql
  # config.active_record.observers = :cacher, :garbage_collector
end
