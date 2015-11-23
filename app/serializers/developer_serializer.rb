require_relative './serializer'

class DeveloperSerializer < Serializer
  @@keys = []

  def initialize(object)
    super @@keys, object
  end

end
