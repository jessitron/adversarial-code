require_relative 'spec_helper'

RSpec.describe "the game of life (don't talk to me about life)" do

  specify "a cell starts out dead" do
    cell = Cell.new
    expect( cell ).to be_dead
  end

  specify "a dead cell looks dead" do
    cell = Cell.new
    expect(cell.to_s).to eq("☠️")
  end

  specify "a cell can be created alive" do
    cell = Cell.living
    expect( cell ).to_not be_dead # I feel happy! I feel happy!
  end

  specify "a live cell looks happy" do
    cell = Cell.living
    expect(cell.to_s).to eq("🤩")
  end

  describe "a board" do
    it "starts out with the correct number of cells" do
      board = Board.new(3,3)
      expect( board.cells.length ).to eq( 9 )
    end
  end

end
