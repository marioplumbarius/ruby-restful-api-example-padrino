# Helper methods defined here can be accessed in any controller or view in the application

module RestfulApi
  class App
    module DevelopersHelper
      def render_errors(developer)
        {"errors": developer.errors}.to_json
      end
    end

    helpers DevelopersHelper
  end
end
