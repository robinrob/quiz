class Game

  def initialize(selector)
      @selector = selector
  end


  def play(goes, guesses)
    goes.times do
      pair = @selector.select()

      continue = true
      guesses.times do |i|
        print pair.tagalog.cyan + ": "
        guess = STDIN.gets.chomp.strip.downcase()
        answers = pair.english.downcase().split("-").each { |str| str.replace(str.strip) }
        answer = pair.english

        if guess == "pass" or guess == "p"
          response = answer.blue
          continue = false

        elsif guess == answer
          response = "Yes!".green
          if answers.size() > 1
            response << " (" + answer + ")"
          end
            
          continue = false
          

        elsif guess == "exit"
          exit(0)

        elsif i == guesses - 1
          response = answer.blue

        else
          response = "No!".red
        end

        puts "" + response + "\n"
        break unless continue
      end

    end

  end

end