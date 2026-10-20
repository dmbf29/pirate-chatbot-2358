class MessageView
  def ask_for_question
    puts "What's the question?"
    gets.chomp
  end

  def display_message(llm_message)
    # p llm_message # an INSTANCE of a messsage
    puts "#{llm_message.role}: #{llm_message.content}"
  end

end
