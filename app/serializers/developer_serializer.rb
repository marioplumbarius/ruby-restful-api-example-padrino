class DeveloperSerializer < Serializer

  KEYS = [:projects]

  def initialize(object)
    super object, KEYS
  end

end
