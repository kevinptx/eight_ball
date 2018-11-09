require "pry"

class Answer
  attr_accessor :answers 

  def initialize
    @answers = [
      "You win!",
      "You made it!",
      "You'll succeed",
      "Yes",
      "No",
      "It's your time!",
      "It's a great day!",
      "This is your year!",
    ]
    binding.pry
  end

  # def new_answer
  #   answer_clone = @answers.clone
  #   puts "*******MENU********"
  #   puts "1) View answer list\n2) Add new answer\n3) Reset Answer"
  #   user_choice = gets.strip.to_i
    
  #   case user_choice
  #   when 1
  #     binding.pry
  #     puts @answers
  #   when 2
  #     puts "Enter new answer:"
  #     new_string = gets.strip
  #     @answers << new_string
  #     binding.pry
  #   when 3
  #     @answers = answer_clone
  #   end
  # end
end

#approach 1
#could have a separate array that any new response goes into...when they add. When they reset it empties it. You need other logic to bring it in and add to all the answers.

#maybe make a new method or store the variable as an instance variable (@) in a class.

#.clone take the existing array and call .clone on that array and set it equal to a new array, maybe @new_answers or @user_answers.

#to do this, create a new method and call it in the answer_menu method.
