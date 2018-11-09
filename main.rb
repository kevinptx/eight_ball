require_relative "./answers"

require "pry"
class EightBall < Answer
  attr_accessor :name, :question

  def initialize(name, question)
    @name = name
    @question = question
    @answer_clone = []
    super()
    create_answer
  end

  def create_answer
    answer = @answers.sample
    puts "#{name}, you asked: #{question}. The answer is: #{answer}"
  end
end

def menu
  puts "*******WELCOME TO EIGHT BALL********"
  puts "1) Ask eight ball question\n2) Game menu"
  menu_ans =gets.strip.to_i
  if menu_ans == 1
    get_user_input
  else
    new_answer
    menu
  end
end

def new_answer
  @answer_clone = @answers.clone
  puts "*******MENU********"
  puts "1) View answer list\n2) Add new answer\n3) Reset Answer"
  user_choice = gets.strip.to_i
  
  case user_choice
  when 1
    puts @answers
  when 2
    puts "Enter new answer:"
    new_string = gets.strip
    @answers << new_string
  when 3
    @answers = @answer_clone
  end
end

def get_user_input
  puts "Type your Name:"
  name = gets.strip
  puts "Type your question:"
  question = gets.strip

  EightBall.new(name, question)
end

menu
