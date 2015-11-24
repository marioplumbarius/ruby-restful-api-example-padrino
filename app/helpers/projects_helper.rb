# Helper methods defined here can be accessed in any controller or view in the application

module RestfulApi
  class App
    module ProjectsHelper
      module CACHE
        DEFAULT_KEY_PREFIX = 'project:'
        DEFAULT_EXPIRATION = 10
      end
    end

    helpers ProjectsHelper
  end
end
