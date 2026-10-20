require 'ruby_llm'
require_relative '../views/message_view'
require_relative '../models/message'

class MessagesController
  SYSTEM_PROMPT = "
  You are a programming teacher giving advice to a student. You are a pirate and can only speak like a pirate (like nautical terms and pirate slang). Keep answer to 3 sentences maximum.
  "

  def initialize(message_repository)
    @message_repository = message_repository
    # Inside of the view, puts / gets.chomp
    @message_view = MessageView.new
    # who the chat is, who we are, and additional context
    @chat = RubyLLM.chat.with_instructions(SYSTEM_PROMPT)
  end

  def add
    # question = tell the view to get a question from the user
    question = @message_view.ask_for_question
    # create a new instance of a message (with the role of a user)
    message = Message.new(content: question, role: 'user')
    # give the new message into the repository
    @message_repository.create(message)

    # response = give our question to the llm
    response = @chat.ask(question)
    # create a new instance of a message (with the role of an assitant)
    llm_message = Message.new(content: response.content, role: 'assistant')
    # give the LLM message to the repository
    @message_repository.create(llm_message)
    # display the LLM message to the user
    @message_view.display_message(llm_message)
  end

  def list
    # 1. Get messages (repo)
    messages = message_repository.all
    # 2. Display them in the terminal (view)
    @message_view.display_list(messages)
  end
end
