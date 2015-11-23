class Serializer

  def initialize(keys=[], object)
    @keys = keys
    @object = object
  end

  def render
    if @keys.empty?
      @object.to_json
    else
      @object.to_json include: @keys
    end
  end

end
