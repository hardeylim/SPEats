class BaseService
  attr_reader :errors

  def initialize
    @errors = []
  end

end
