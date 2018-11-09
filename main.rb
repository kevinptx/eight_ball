require "pry"
require_relative "./answers"

class EightBall < Answer
  #attr_accessor :name, :question

  def initialize
    @clone_arr = []
    super()
  end

  def give_answer
    puts
    puts "*" * 25
    puts
    answer = @answers.sample
    puts "The Eight Ball says #{answer}"
    puts
    puts "*" * 25
    #puts "#{name}, you asked: #{question}. The answer is: #{answer}"
    get_user_input
  end

  def add_user_answers
    puts
    puts "*" * 25
    puts "Add your answer to the answer list, or type 'exit' to go back to start."
    puts
    input = gets.strip.to_s
    if input == "exit"
      get_user_input
      #if the answer array includes the provided user input
    elsif @answers.include? input
      puts
      puts "I can't create duplicate answers. Try again."
      #back to the beginning
      add_user_answers
      puts
    else
      #if answer is not a duplicate in the @answers array, add it to that array
      @answers << input
    end
    get_user_input
  end

  # def menu
  #   puts "Select from the NUMERICAL menu choices below:"
  #   puts "1) PLAY Game\n 2) Edit and/or VIEW Game answer choices\n"
  #   choice = gets.strip.to_i
  #   if choice == 1
  #     get_user_input
  #   else
  #     Answer.answer_menu
  #   end

  def get_user_input
    puts
    puts "Type your question below:"
    puts
    question = gets.strip.to_s.downcase
    handle_user_input(question)
  end

  def handle_user_input(input)
    case input
    when "exit"
      exit_program
    when "print_answers"
      puts
      puts "Printing all of the answers..."
      print_answers
      #reset answers back to the original array
    when "reset_answers"
      puts "Resetting back to game's original answers and sending you back to the game start."
      puts
      #resetting the answers back to the original array
      @answers = @clone_arr
      get_user_input
      #add answers to answer array
    when "add_answers"
      #first clone the array and add the answers to that in order to preserve original array
      @clone_arr = @answers.clone
    else
      #otherwise simply have the program provide a random sample from @answers array
      give_answer
    end
  end

  def exit_program
    puts "Thanks for playing Eight Ball!"
    puts
    puts "Bye!"
  end

  def print_answers
    puts
    answers.each_with_index do |answer, index|
      puts "#{index + 1} #{answer}"
    end
    puts
    get_user_input
  end
end

# def answer_menu
#   puts "Select from the NUMERICAL menu choices below:"
#   puts "1) ADD Answers\n 2) RESET Answers\n 3) PRINT Answers\n"
#   choice = gets.strip.to_i
#   case choice
#   when 1
#     #shovel into the @answers array.
#   when 2
#     #answers.clone
#   when 3
#     #print 4 original and added answers altogether
#   else
#     EightBall.menu
#   end
# end

run = EightBall.new
run.get_user_input
