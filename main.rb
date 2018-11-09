
# Magic Eight Ball Assignment Pseudocode:
# The team leader: in the command line:

# Create an eight_ball directory
# Create main.rb and answers.rb files in that directory
# Create a git repository in that directory
# The team leader then create a git repository on GitHub, push project to GitHub, and add additional partners to project.

# Divide up the work below to complete the project please try to focus on using Classes for this assignment. (Don’t be afraid of more than one person coding the same file, as this will give you practice with Git flow and merge conflict resolution. The more practice you have now with Git the better you will be down the road.)

# Basic Objectives:

# - User inputs question
# - Computer outputs random answer
# - User inputs "QUIT"
# - Computer outputs a goodbye message and exits
# - ability to add more answers:
# - via easter egg question ("add_answers")
# - do not let them add the same answer if the eight ball already has that answer
# - ability to reset answers back to the original bank (hint: think arr.clone)
# - via easter egg question ("reset_answers")
# - ability to have eight ball print all answers
# - via easter egg question ("print_answers")
# Bonus Objectives:

# # # # # # # # # # -ability to use script arguments when the magic eight ball is started to do bonus functionality above
# # # # # # # # # # - for example ruby magic_eight.RB add_answers
# # # # # # # # # # this would start your script but instead of running the regular way you would be prompted to add answers first

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
    puts "Add your answer to the answer list below, or type 'q' to go back to start: "
    puts
    input = gets.strip.to_s.downcase
    #if they select q for quit/exit then go back to the initiating method method
    if input == "q"
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
    puts "Type your question below or select from the following:"
    puts
    puts "1) Type Q to exit program"
    puts
    puts "2) Type P to print all answers"
    puts
    puts "3) Type R to reset answers to originals"
    puts
    puts "4) Type A to add your own answers to the originals"
    puts
    question = gets.strip.to_s.downcase
    puts
    handle_user_input(question)
  end

  def handle_user_input(input)
    case input
    when "q"
      exit_program
    when "p"
      puts
      puts "Printing all of the answers..."
      print_answers
      #reset answers back to the original array
    when "r"
      puts "Resetting back to game's original answers and sending you back to the game start."
      puts
      #resetting the answers back to the original array
      @answers = @clone_arr
      get_user_input
      #add answers to answer array
    when "a"
      #first clone the array and add the answers to that in order to preserve original array
      @clone_arr = @answers.clone
      #call the add_user_answers function
      add_user_answers
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
    @answers.each_with_index do |answer, index|
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
