require_relative 'player'

class Game
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = @player1
  end

  def generate_question
    num1 = rand(1..20)
    num2 = rand(1..20)
    [num1, num2]
  end

  def ask_question
    num1, num2 = generate_question
    correct_answer = num1 + num2

    puts "#{@current_player.name}, what is #{num1} + #{num2}?"
    player_answer = gets.chomp.to_i

    if player_answer == correct_answer
      puts "Correct!"
    else
      puts "Wrong! The correct answer was #{correct_answer}."
      @current_player.lives -= 1
    end
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def display_scores
    puts "Scores: #{@player1.name} - #{@player1.lives} lives, #{@player2.name} - #{@player2.lives} lives"
  end

  def play
    until @player1.lives == 0 || @player2.lives == 0
      ask_question
      display_scores
      switch_player
    end

    winner = @player1.lives > 0 ? @player1 : @player2
    loser = @player1.lives > 0 ? @player2 : @player1

    puts "#{winner.name} wins with #{winner.lives} lives left! #{loser.name} loses with #{loser.lives} lives."
  end
end
