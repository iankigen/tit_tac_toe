RSpec.describe Game do
  player = Game.new

  it 'has a version number' do
    expect(TicTacToe::VERSION).not_to be nil
  end

  it 'player position is 1..9' do
    expect(player.positions).to eq %w[1 2 3 4 5 6 7 8 9]
  end

  it 'displays grid' do
    expect do
      player.display_grid
    end.to output("-------------\n|   |   |   |\n-------------\n|   |   |   |\n-------------\n|   |   |   |\n-------------\n").to_stdout
  end

  it 'adjust the grid on players move' do
    pos = 3
    player.adjust_grid('1', pos)
    expect(player.player_1[0]).to be (pos - 1)
  end
end
