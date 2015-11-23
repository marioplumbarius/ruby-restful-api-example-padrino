class Serializer

  def initialize(object, keys=[])
    @object = object
    @keys = keys
  end

  def render
    if @keys.empty?
      @object.to_json
    else
      @object.to_json include: @keys
    end
  end

end
