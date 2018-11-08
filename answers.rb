class Answer
  answer_randomizer

  def answer_randomizer
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
    randomize = @answers.rand
    puts randomize
  end
end

Answer.new
