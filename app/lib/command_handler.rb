class CommandHandler
  RecordNotFound = Class.new(SerializedError)
  RecordInvalid = Class.new(SerializedError)

  def self.new(*)
    super
  rescue ActiveRecord::RecordNotFound => e
    raise RecordNotFound, e.record
  rescue ActiveRecord::RecordInvalid => e
    raise RecordInvalid, e.record
  end
end
