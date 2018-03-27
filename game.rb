require './player'
require './question'

class Game

  def initialize(player1_name, player2_name)
    @player1 = Player.new(player1_name);
    @player2 = Player.new(player2_name);

    @current_player = @player1;
  end

  def display_scores()
    puts "++++++++++++ SCORES ++++++++++++"
    puts "#{@player1.instance_variable_get(:@name)}: #{@player1.instance_variable_get(:@lives)} lives remaining."
    puts "#{@player2.instance_variable_get(:@name)}: #{@player2.instance_variable_get(:@lives)} lives remaining."
  end

  def change_player()
    if(@current_player == @player1)
      @current_player = @player2
    elsif(@current_player == @player2)
      @current_player = @player1
    end
  end

  def check_answer(player_turn)
    question = player_turn[0]
    guess = player_turn[1]

    if(!question.check_answer(guess))
      puts "Ya got it wrong #{@current_player.instance_variable_get(:@name)}.\n\n"
      @current_player.lost_life()
    else
      puts "Ya did it #{@current_player.instance_variable_get(:@name)}.\n\n"
    end
  end

  def ask_question()
    question = Question.new(@current_player.instance_variable_get(:@name))
    guess = gets.chomp
    return [question, guess]
  end

  def start()
    while(!@player1.dead?() && !@player2.dead?())

      player_turn = self.ask_question();
      self.check_answer(player_turn);
      self.display_scores();
      self.change_player();

    end
    puts "Game Over #{@current_player.instance_variable_get(:@name)} wins with a score of #{@current_player.instance_variable_get(:@lives)}"

  end
end

game = Game.new("David", "Stewart")
game.start
