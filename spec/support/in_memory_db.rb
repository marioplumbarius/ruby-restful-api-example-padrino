RSpec.configure do |config|
  # loads migrations
  config.before(:suite) do
    silence_stream STDOUT do
      load "#{Padrino.root}/db/schema.rb"
    end
  end
end
