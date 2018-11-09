require "pry"

class Answer
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
  end
end

#approach 1
#could have a separate array that any new response goes into...when they add. When they reset it empties it. You need other logic to bring it in and add to all the answers.

#maybe make a new method or store the variable as an instance variable (@) in a class.

#.clone take the existing array and call .clone on that array and set it equal to a new array, maybe @new_answers or @user_answers.

#to do this, create a new method and call it in the answer_menu method.
