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
        answers = record.answer.downcase().split("-").each { |str| str.replace(str.strip) }
        answer = record.answer

        if guess == "pass" or guess == "p"
          response = answer.blue
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

        elsif i == guesses - 1
          response = answer.blue

        else
          response = "No!".red
        end

        puts "" + response + "\n"
        break unless continue
      end

    end
    
    puts "score: #{score}/#{goes}".yellow

  end

end