class Game

  attr_accessor :player_1_name, :player_2_name

  def initialize(player_1_name, player_2_name)
    @player_1_name = player_1_name
    @player_2_name = player_2_name
    set_up_game_board()
  end

  def turn(player)
    if player == 1
      puts "#{@player_1_name}'s turn."
    elsif player == 2
      puts "#{@player_2_name}'s turn."
    end
    puts "Where would you like to drop your chip?"
    down_the_hatch(player)
    show_game_board()
  end

  def down_the_hatch(player)
    column = gets.chomp.to_i
    until is_good_choice(column) == true
      column = gets.chomp.to_i
    end
    6.times do |index|
      if @game_board_array[column-1][index].player == nil
        @game_board_array[column-1][index].played(player)
        break
      end
    end
  end

  def is_good_choice(choice)
    if (1..7).include?(choice)
      if @game_board_array[choice-1].last.player != nil
        puts "That one is all filled up!"
        return false
      else
        return true
      end
    else
      puts "It has to be a number between 1 and 7."
    end
  end
    

  def test_win
    if win_conditions()
      puts "You've won!"
      return true
    else
      return false
    end
  end

  def win_conditions

    if horizontal_win() || verticle_win() || up_down_diag_win() || down_up_diag_win()
      return true
    else
      return false
    end
  end

  def horizontal_win()
    win_1 = [1,1,1,1]
    win_2 = [2,2,2,2]
    4.times do |v_index|
      6.times do |h_index|
        check = [@game_board_array[v_index][h_index].player, @game_board_array[v_index+1][h_index].player, @game_board_array[v_index+2][h_index].player, @game_board_array[v_index+3][h_index].player]
        if check == win_1 or check == win_2
          return true
        end
      end
    end
    return false
  end

  def verticle_win()
    win_1 = [1,1,1,1]
    win_2 = [2,2,2,2]
    3.times do |h_index|
      7.times do |v_index|
        check = [@game_board_array[v_index][h_index].player, @game_board_array[v_index][h_index+1].player, @game_board_array[v_index][h_index+2].player, @game_board_array[v_index][h_index+3].player]
        if check == win_1 or check == win_2
          return true
        end
      end
    end
    return false

  end

  def up_down_diag_win()
    win_1 = [1,1,1,1]
    win_2 = [2,2,2,2]
    4.times do |v_index|
      3.times do |h_index|
        check = [@game_board_array[v_index][h_index+3].player, @game_board_array[v_index+1][h_index+2].player, @game_board_array[v_index+2][h_index+1].player, @game_board_array[v_index+3][h_index].player]
        if check == win_1 or check == win_2
          return true
        end
      end
    end
    return false

  end

  def down_up_diag_win()
    win_1 = [1,1,1,1]
    win_2 = [2,2,2,2]
    4.times do |v_index|
      3.times do |h_index|
        check = [@game_board_array[v_index][h_index].player, @game_board_array[v_index+1][h_index+1].player, @game_board_array[v_index+2][h_index+2].player, @game_board_array[v_index+3][h_index+3].player]
        if check == win_1 or check == win_2
          return true
        end
      end
    end
    return false

  end

  def set_up_game_board()
    @game_board_array = Array.new(7) { Array.new(6)}
    7.times do |v_index|
      6.times do |h_index|
        @game_board_array[v_index][h_index] = Board_Loc.new(nil,[v_index, h_index])
      end
    end
  end

  def show_game_board
    puts "Player 1 is #{@player_1_name} \u26AB \n\n"
    puts "Player 2 is #{@player_2_name} \u26D4 \n\n"
    puts "  1   2   3   4   5   6   7  "
    puts "+---+---+---+---+---+---+---+"
    puts "|#{@game_board_array[0][5].token}|#{@game_board_array[1][5].token}|#{@game_board_array[2][5].token}|#{@game_board_array[3][5].token}|#{@game_board_array[4][5].token}|#{@game_board_array[5][5].token}|#{@game_board_array[6][5].token}|"
    puts "+---+---+---+---+---+---+---+"
    puts "|#{@game_board_array[0][4].token}|#{@game_board_array[1][4].token}|#{@game_board_array[2][4].token}|#{@game_board_array[3][4].token}|#{@game_board_array[4][4].token}|#{@game_board_array[5][4].token}|#{@game_board_array[6][4].token}|"
    puts "+---+---+---+---+---+---+---+"
    puts "|#{@game_board_array[0][3].token}|#{@game_board_array[1][3].token}|#{@game_board_array[2][3].token}|#{@game_board_array[3][3].token}|#{@game_board_array[4][3].token}|#{@game_board_array[5][3].token}|#{@game_board_array[6][3].token}|"
    puts "+---+---+---+---+---+---+---+"
    puts "|#{@game_board_array[0][2].token}|#{@game_board_array[1][2].token}|#{@game_board_array[2][2].token}|#{@game_board_array[3][2].token}|#{@game_board_array[4][2].token}|#{@game_board_array[5][2].token}|#{@game_board_array[6][2].token}|"
    puts "+---+---+---+---+---+---+---+"
    puts "|#{@game_board_array[0][1].token}|#{@game_board_array[1][1].token}|#{@game_board_array[2][1].token}|#{@game_board_array[3][1].token}|#{@game_board_array[4][1].token}|#{@game_board_array[5][1].token}|#{@game_board_array[6][1].token}|"
    puts "+---+---+---+---+---+---+---+"
    puts "|#{@game_board_array[0][0].token}|#{@game_board_array[1][0].token}|#{@game_board_array[2][0].token}|#{@game_board_array[3][0].token}|#{@game_board_array[4][0].token}|#{@game_board_array[5][0].token}|#{@game_board_array[6][0].token}|"
    puts "+---+---+---+---+---+---+---+"
  end
end

class Board_Loc

  attr_accessor :player, :position, :token

  def initialize(player, position)
    @player = player
    @position = position
    @token = "   "
  end

  def played(player)
    @player = player
    if player == 1
      @token = "\u26AB "
    elsif player == 2
      @token = "\u26D4 "
    end
  end

end

def game_loop
  game = start_game()
  turn_1 = true
  while game.test_win == false
    if turn_1 == true
      game.turn(1)
      turn_1 = false
    elsif turn_1 == false
      game.turn(2)
      turn_1 = true
    end
  end
  if turn_1 == false
    puts "#{game.player_1_name} won!"
  else
    puts "#{game.player_2_name} won!"
  end
end

def start_game
  names = []
  names[0] = get_name(1)
  names[1] = get_name(2)
  game = Game.new(names[0], names[1])
  game.show_game_board()
  return game
end

def get_name(player)
  puts "Player #{player}, please enter your name."
  name = gets.chomp
  puts "#{name}? OK, then. Very well.\n\n"
  return name
end 

def quit?()
  while true
    puts "Would you like to play again?"
    play_again = gets.chomp.downcase
    if play_again == 'n'
      puts "Thank you for playing."
      return true
    elsif play_again == 'y'
      return false
    else
      puts "I didn't understand that."
    end
  end
end

def lets_play
  puts "Welcome to Connect 4!"
  puts "The rules are simple. Drop your chip into the top of the board."
  puts "The first person to get 4 of their chips lined up in a row wins!"
  puts "It can be horizontal, verticle, or diagonal."
  play = true
  while play == true
    game_loop()
    if quit?()
      play = false
    end
  end
end

lets_play()
