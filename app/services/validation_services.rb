class ValidationServices
  def initialize(object,  param)
    @object = object
    @param = param
  end

  def self.validate!(object, param)
    new(object, param).validate!
  end

  def validate!
    object_to_validate = @object.camelize.constantize
    if response = object_to_validate.find_by(code: @params)
      response.destroy
      true
    else
      false
    end
  end
end

