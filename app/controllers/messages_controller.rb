require 'ruby_llm'
require_relative '../views/message_view'

class MessagesController
  def initialize(message_repository)
    @message_repository = message_repository
    # Inside of the view, puts / gets.chomp
    @message_view = MessageView.new
    chat = RubyLLM.chat
  end

  def add
    # question = tell the view to get a question from the user
    question = @message_view.ask_for_question
    # create a new instance of a message (with the role of a user)
    message = Message.new(content: question, role: 'user')
    # give the new message into the repository
    @message_repository.create(message)

    # response = give our question to the llm
    response = chat.ask(question)
    # create a new instance of a message (with the role of an assitant)
    llm_message = Message.new(content: response.content, role: 'assistant')
    # give the LLM message to the repository
    @message_repository.create(llm_message)
    # display the LLM message to the user
    @message_view.display_message(llm_message)
  end
end
