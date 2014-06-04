require 'colorize'

class Game

  def initialize(selector)
      @selector = selector
  end


  def play(goes, guesses)
    score = 0
    goes.times do
      record = @selector.select()

      continue = true
      guesses.times do |i|
        print record.question.cyan + ": "
        guess = STDIN.gets.chomp.strip.downcase()
        answers = record.answers

        if guess == "pass" or guess == "p"
          response = reveal_answers(answers)
          continue = false

        elsif answers.include?(guess)
          score = score + 1
          response = "Yes!".green
          if answers.size() > 1
            response << " (" + answer + ")"
          end
            
          continue = false

        elsif guess == "exit"
          exit(0)

        elsif i + 1 == guesses
          response = reveal_answers(answers)

        else
          response = "No!".red
        end

        puts "" + response + "\n"
        break unless continue
      end

    end
    
    puts "score: #{score}/#{goes}".yellow

  end


  def reveal_answers(answers)
    answers.join(" - ").blue
  end

end