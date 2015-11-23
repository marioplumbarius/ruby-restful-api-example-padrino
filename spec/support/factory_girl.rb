RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  # validates all factories
  config.before(:suite) do
    FactoryGirl.lint
  end

  # loads the factories and registers them
  FactoryGirl.find_definitions
end
