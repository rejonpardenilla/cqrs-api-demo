class ApplicationController < ActionController::API
  def execute(command)
    command_bus.(command)
  rescue Command::Invalid => e
    # Maybe parsing here the validation errors from struct to deliver them to the client.
    respond_to json: e.to_h, response_code: 422
  rescue SerializedError => e
    respond_to json: e.to_h, response_code: e.response_code
  end

  def command_bus
    @command_bus ||= Rails.configuration.command_bus
  end
end
