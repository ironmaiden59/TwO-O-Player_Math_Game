class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = @player1
  end

  def switch_player
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  def play
    while @player1.is_alive? && @player2.is_alive?
      question = Question.new
      puts "#{@current_player.name}: What does #{question.number1} plus #{question.number2} equal?"
      user_answer = gets.chomp.to_i

      if question.is_correct?(user_answer)
        puts "#{@current_player.name}: YES! You are correct."
      else
        puts "#{@current_player.name}: Seriously? No!"
        @current_player.lose_life
      end

      score = Score.new
      puts score.display(@player1, @player2)
      switch_player
    end

    winner = @player1.is_alive? ? @player1 : @player2
    puts "#{winner.name} wins!"
  end
end