# Helper methods defined here can be accessed in any controller or view in the application

module RestfulApi
  class App
    module AppHelper
      HTTP_METHODS_REQUIRES_BODY = ['POST', 'PATCH', 'PUT'].freeze

      # TODO: test me!
      def body_valid?(request_body, valid_keys)
        request_body.keys.each do |key|
          return false unless valid_keys.include? key
        end

        return true
      end

      # TODO: test me!
      def request_requires_body?(request)
        HTTP_METHODS_REQUIRES_BODY.include? request.env['REQUEST_METHOD']
      end

    end

    helpers AppHelper
  end
end
