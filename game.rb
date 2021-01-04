require './player.rb'
require './question.rb'

class Game
  def initialize
    # Create two players
    @p1 = Player.new
    # Set Player 1 to answer first
    @p1.current_player = true

    @p2 = Player.new
    @p2.current_player = false

    # Set first turn to true
    @firstTurn = true
  end

  def question
    @newQuestion = Question.new
    # Check if it is not the first turn
    if @firstTurn == false
      puts "----- NEW TURN -----" 
    end
    # Set the player currently playing
    if @p1.current_player == true
      playerName = "Player 1"
    else
      playerName = "Player 2"
    end
    # Asks question to player
    puts playerName + ": " + @newQuestion.question
    print "> "
    # Set players guess to variable
    @playerGuess = gets.chomp.to_i
    # Goes to checkAns module
    checkAns
  end

  def checkAns
    # Check if player's answer is correct
    if @playerGuess == @newQuestion.ans
      puts @newQuestion.correct
    else
      puts @newQuestion.incorrect
      # If answer is incorrect, current player loses 1 life
      if @p1.current_player == true
        @p1.lives -= 1
      else
        @p2.lives -= 1
      end
    end
    # Check if player has 0 lives or continue
    checkScore
  end

  def checkScore
    # Check if either player is at 0 lives
    if @p1.lives == 0 || @p2.lives == 0
      # Display victory text for player
      if @p1.lives == 0
        puts "Player 2 wins with a score of #{@p2.lives}/3"
      elsif @p2.lives == 0
        puts "Player 1 wins with a score of #{@p1.lives}/3"
      end
      # Display Game Over and Good bye after
      puts "----- GAME OVER -----"
      puts "Good bye!"
    else
      # Display score if players have more than 0 lives
      puts "P1: #{@p1.lives}/3 vs P2: #{@p2.lives}/3"
      # Set first turn to false
      @firstTurn = false
      # Alternate the current active player
      if @p1.current_player == true
        @p1.current_player = false
        @p2.current_player = true
      else
        @p1.current_player = true
        @p2.current_player = false
      end
      # Ask another question
      question
    end
  end
end