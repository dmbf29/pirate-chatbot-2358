class MessageRepository
  def initialize
    @messages = []
  end

  def all
    @messages
  end

  def create(message)
    @messages << message
  end
end
