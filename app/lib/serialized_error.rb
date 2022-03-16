class SerializedError < StandardError
  attr_reader :record, :errors

  def initialize(record = nil, errors: {})
    @record = record
    @errors = record&.errors&.messages || errors

    super(record)
  end

  def to_h
    errors.to_h
  end

  def response_code
    500
  end
end
