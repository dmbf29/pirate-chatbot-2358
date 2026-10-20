# List the user actions, and call correct controlller
# 1. Ask the pirate a question
# 2. See previous questions
# 3. quit

class MessagesRouter
  def initialize(messages_controller)
    @messages_controller = messages_controller
    @running = true
  end

  def run
    puts "Ahoy! Welcome aboard the Codebeard chatbot."

    while @running
      display_actions
      @choice = gets.chomp.to_i
      # call the correct controller
      route_action
    end
  end

  def route_action
    case @choice
    when 1 then @messages_controller.add
    when 2 then @messages_controller.list
    when 3 then stop
    else
      puts "Wrong action"
    end
  end

  def display_actions
    puts "Hi Matey!"
    puts "1. Ask the pirate a question"
    puts "2. See all questions"
    puts "3. Stop and quit"
  end

  def stop
    @running = false
  end

end
