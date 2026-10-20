require_relative 'config' # add my API key to RubyLLM
require_relative 'app/repositories/message_repository'
require_relative 'app/controllers/messages_controller'
require_relative 'app/routers/messages_router'

csv_file_path = 'data/messages.csv'
message_repository = MessageRepository.new(csv_file_path)
messages_controller = MessagesController.new(message_repository)

router = MessagesRouter.new(messages_controller)
router.run
