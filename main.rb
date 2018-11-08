require_relative "./answers"

class EightBall < Answer
  attr_accessor :name, :question

  def initialize(name, question)
    @name = name
    @question = question
    super()
    create_answer
  end

  def create_answer
    answer = @answers.sample
    puts "#{name}, you asked: #{question}. The answer is: #{answer}"
  end
end

def get_user_input
  puts "Type your Name:"
  name = gets.strip
  puts "Type your question:"
  question = gets.strip

  EightBall.new(name, question)
end

get_user_input
