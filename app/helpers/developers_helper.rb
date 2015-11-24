# Helper methods defined here can be accessed in any controller or view in the application

module RestfulApi
  class App
    module DevelopersHelper
      DEVELOPER_CACHE_KEY_PREFIX = 'developer:'
      DEVELOPER_CACHE_DEFAULT_EXPIRATION = 10
    end

    helpers DevelopersHelper
  end
end
