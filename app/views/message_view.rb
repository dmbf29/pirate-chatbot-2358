class MessageView
  def display_list(messages)
    messages.each do |message|
      prefix = message.role == "user" ? "You" : "🏴‍☠️"
      puts "#{prefix}: #{message.content}"
    end
  end

  def ask_for_question
    puts "What's the question?"
    print "> "
    gets.chomp
  end

  def display_message(message)
    # p llm_message # an INSTANCE of a messsage
    prefix = message.role == "user" ? "You" : "🏴‍☠️"
    puts "#{prefix}: #{message.content}"
  end

end
