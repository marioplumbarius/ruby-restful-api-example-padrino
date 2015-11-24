# Helper methods defined here can be accessed in any controller or view in the application

module RestfulApi
  class App
    module DevelopersHelper
      module CACHE
        DEFAULT_KEY_PREFIX = 'developer:'
        DEFAULT_EXPIRATION = 10
      end
    end

    helpers DevelopersHelper
  end
end
