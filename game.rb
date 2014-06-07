require 'colorize'

load "response.rb"

class Game

  def initialize(selector, database)
      @selector = selector
      @database = database
      @score = 0
  end


  def play(goes, guesses)
    goes.times do
      record = @selector.select()

      guesses.times do |i|
        print record.question.cyan + ": "
        guess = STDIN.gets.chomp.strip.downcase()
        answers = record.answers

        break unless respond(guess, record.answers)
      end
    
    puts "score: #{score}/#{goes}".yellow

    end
  end


  def respond(guess, answers)

    if guess == "pass" or guess == "p"
      response = _pass(answers)

    elsif answers.include?(guess)
      response = _correct(answers)

    elsif guess == "exit"
      exit(0)

    elsif i + 1 == guesses
      response = reveal_answers(answers)

    else
      response = _incorrect(answers)
    end

    puts response.response + "\n"
    response.continue?

  end


  def _pass(answers)
    Response.new(_reveal_answers(answers), false)
  end


  def _reveal_answers(answers)
    answers.join(" - ").blue
  end


  def _correct(answers)
    @score += 1
    response = "Yes!".green

    if answers.size() > 1
      response << " (" + answers.join(" ") + ")"
    end

    Response.new(response, true)
  end


  def _incorrect(answers)

    Response.new("No!".red, true)
  end


end