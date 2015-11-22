RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  # validates all factories
  config.before(:suite) do
    begin
      DatabaseCleaner.start
      FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
  end

  # loads the factories and registers them
  FactoryGirl.find_definitions
end
