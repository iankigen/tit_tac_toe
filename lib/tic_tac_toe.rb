require 'set'
class Game
  attr_accessor :grid, :positions, :player_1, :player_2

  def initialize
    @grid = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @positions = %w[1 2 3 4 5 6 7 8 9]
    @player_1 = []
    @player_2 = []
  end

  def display_grid
    puts '-' * 13
    puts "| #{@grid[0]} | #{@grid[1]} | #{@grid[2]} |"
    puts '-' * 13
    puts "| #{@grid[3]} | #{@grid[4]} | #{@grid[5]} |"
    puts '-' * 13
    puts "| #{@grid[6]} | #{@grid[7]} | #{@grid[8]} |"
    puts '-' * 13
  end

  def display_postions
    puts '-' * 13
    puts "| #{@positions[0]} | #{@positions[1]} | #{@positions[2]} |"
    puts '-' * 13
    puts "| #{@positions[3]} | #{@positions[4]} | #{@positions[5]} |"
    puts '-' * 13
    puts "| #{@positions[6]} | #{@positions[7]} | #{@positions[8]} |"
    puts '-' * 13
    menu
  end

  def get_position(player)
    puts "Player #{player}, Select a position : "
    user_input = gets.chomp.to_i
    if user_input.zero? || !@positions.include?(user_input.to_s)
      puts 'Invalid Input'
      get_position(player)
    elsif @player_1.include?(user_input - 1) || @player_2.include?(user_input - 1)
      puts 'Position already taken'
      get_position(player)
    else
      user_input
    end
  end

  def adjust_grid(player, position)
    position = position.to_i - 1
    if player == '1'
      @player_1 << position
      @grid[position] = 'X'
    else
      @player_2 << position
      @grid[position] = 'O'
    end
  end

  def determine_winner
    winner = nil
    winning_positions = {
      a: [0, 1, 2],
      b: [3, 4, 5],
      c: [6, 7, 8],
      d: [0, 4, 8],
      e: [2, 4, 6],
      f: [0, 3, 6],
      g: [1, 4, 7],
      h: [2, 5, 8]
    }

    winning_positions.each do |_key, val|
      if val.to_set.subset? @player_1.to_set
        exit_game('PLAYER 1 WON')
        winner = '1'
      elsif val.to_set.subset? @player_2.to_set
        exit_game('PLAYER 2 WON')
        winner = '2'
      end
    end
    winner
  end

  def play
    9.times do |i|
      if i.even?
        user_input = get_position('1')
        adjust_grid('1', user_input)
      elsif i.odd?
        user_input = get_position('2')
        adjust_grid('2', user_input)
      end
      display_grid
      determine_winner
    end
  end

  def menu()
    puts '===== TICTACTOE v1.0 ====='
    puts 'OPTION'
    puts '1: Play Game'
    puts '2: Display positions'
    puts '3: Exit'

    input = gets.chomp

    case input
    when '1' then
      play
    when '2' then
      display_postions
    when '3' then
      exit_game
    else
      puts 'Invalid Input'
      menu
    end
  end

  def exit_game(msg = nil)
    puts msg if msg
    puts '===== TICTACTOE v1.0 ====='
    true
  end
end


player = Game.new
# player.menu
