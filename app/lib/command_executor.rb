class CommandExecutor
  def initialize
  end

  def execute(command)
    @bus.(command)
  end
end
