require 'colorize'

load "response.rb"

class Game

  def initialize(database, selector)
      @selector = selector
      @database = database
      @score = 0
      @current_question
      @exit = false
  end


  def play(goes, guesses)
    goes.times do
      @current_question = @selector.select_marked_rate(0.1)

      guesses.times do |i|
        print @current_question.question.cyan + ": "
        guess = STDIN.gets.chomp.strip.downcase()
        answers = @current_question.answers

        break unless _respond(guess, @current_question.answers, guesses - (i - 1))
      end

      break if @exit

    end

    puts "score: #{@score}/#{goes}".yellow

  end


  def _respond(guess, answers, guesses_remaining)

    if guess == "pass" or guess == "p"
      response = _pass()

    elsif answers.include?(guess)
      response = _correct()

    elsif guess == "exit"
      @exit = true
      response = Response.new("Exiting ...".magenta, false)

    elsif guesses_remaining == 0
      response = reveal_answers()
      #@database.mark(@current_question.question)
      @current_question.marked = true

    else
      response = _incorrect(guesses_remaining)
    end

    puts response.response + "\n"
    response.continue?

  end


  def _pass()
    @database.mark(@current_question.question)
    Response.new(_reveal_answers(), false)
  end


  def _reveal_answers()
    @current_question.answers.join(" - ").blue
  end


  def _correct()
    @score += 1
    @current_question.score += 1
    puts "score: " + @current_question.score.inspect
    answers = @current_question.answers
    response = "Yes!".green

    if answers.size() > 1
      response << " (" + answers.join(" ") + ")"
    end

    Response.new(response, false)
  end


  def _incorrect(guesses_remaining)
    Response.new("No!".red, true)
  end


end