RACK_ENV = 'test' unless defined?(RACK_ENV)
require File.expand_path(File.dirname(__FILE__) + '/../../config/boot')
Dir[File.expand_path(File.dirname(__FILE__) + '/../../app/helpers/**/*.rb')].each(&method(:require))

# necessary to load, among others methods, the controller ones, such as 'get', 'post', 'delete', etc
RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end

# You can use this method to custom specify a Rack app
# you want rack-test to invoke:
#
#   app RestfulApi::App
#   app RestfulApi::App.tap { |a| }
#   app(RestfulApi::App) do
#     set :foo, :bar
#   end
#
def app(app = nil, &blk)
  @app ||= block_given? ? app.instance_eval(&blk) : app
  @app ||= Padrino.application
end
