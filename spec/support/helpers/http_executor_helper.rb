module HttpExecutorHelper
  extend Rack::Test::Methods

  def self.execute_request(http_method, url='/', body={})
    case http_method
    when "PUT"
      put url, body
    when "POST"
      post url, body
    when "PATCH"
      patch url, body
    when "DELETE"
      delete url
    when "GET"
      get url
    else
      raise ArgumentError.new "#{http_method} does not exist"
    end

    last_request
  end
end
