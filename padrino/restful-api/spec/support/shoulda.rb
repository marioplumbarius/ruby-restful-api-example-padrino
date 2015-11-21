# In order to use model matchers using ActiveModel/ActiveRecord outside rails apps, we need to manually include them:
RSpec.configure do |config|
  config.include(Shoulda::Matchers::ActiveModel, type: :model)
  config.include(Shoulda::Matchers::ActiveRecord, type: :model)
end
