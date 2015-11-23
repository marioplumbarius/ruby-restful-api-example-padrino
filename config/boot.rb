# Defines our constants
RACK_ENV = ENV['RACK_ENV'] ||= 'development' unless defined?(RACK_ENV)
PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)

# Load our dependencies
require 'bundler/setup'
Bundler.require(:default, RACK_ENV)

##
# ## Enable devel logging
#
# Padrino::Logger::Config[:development][:log_level]  = :devel
# Padrino::Logger::Config[:development][:log_static] = true
#
# ## Enable logging of source location
#
# Padrino::Logger::Config[:development][:source_location] = true
#
# ## Configure your I18n
#
I18n.default_locale = :en
# I18n.enforce_available_locales = false

##
# Add your before (RE)load hooks here
#
Padrino.before_load do
  Padrino.require_dependencies "#{PADRINO_ROOT}/app/serializers/serializer.rb"
  Padrino.require_dependencies "#{PADRINO_ROOT}/app/serializers/developer_serializer.rb"
end

##
# Add your after (RE)load hooks here
#
Padrino.after_load do
  Kaminari.configure do |config|
    config.default_per_page = 10
    config.max_per_page = 50
  end
end

Padrino.load!
