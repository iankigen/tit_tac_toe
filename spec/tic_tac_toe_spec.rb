RSpec.describe Game do

  it 'has a version number' do
    expect(TicTacToe::VERSION).not_to be nil
  end

  it 'initialize a new game' do
    player = Game.new
    expect(player.grid).to eq [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    expect(player.positions).to eq %w[1 2 3 4 5 6 7 8 9]
    expect(player.player_1).to eq []
    expect(player.player_2).to eq []
  end

  it 'displays grid' do
    player = Game.new
    expect do
      player.display_grid
    end.to output("-------------\n|   |   |   |\n-------------\n|   |   |   |\n-------------\n|   |   |   |\n-------------\n").to_stdout
  end

  it 'determines winner' do
    player = Game.new

    player.player_1 = [0, 1, 2, 3]
    expect(player.determine_winner).to eq '1'
    player.player_2 = [2, 5, 8, 3]
    expect(player.determine_winner).to eq '2'
  end

  it 'adjust the grid on players move' do
    player = Game.new
    pos = 3
    player.adjust_grid('1', pos)
    expect(player.player_1[0]).to be(pos - 1)
  end
end
