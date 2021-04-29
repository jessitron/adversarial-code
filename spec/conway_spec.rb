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

    it "is full of death to begin with" do
      Board.new(3,3).cells.each do |c|
        expect(c).to be_dead
      end
    end

    it "can be constructed from a string" do
      s = <<~EOF
        💩💩💩
        💩🤩💩
        💩💩💩
      EOF
      board = Board.from_string(s)
      expect( board.cells.length ).to eq( 9 )
    end

    it "has the same number of cells as the string" do
      s = <<~EOF
        💩
      EOF
      board = Board.from_string(s)
      expect( board.cells.length ).to eq( 1 )
    end

    it "can be created with life" do
      s = <<~EOF
        💩💩💩
        💩🤩💩
        💩💩💩
      EOF
      board = Board.from_string(s)
      alive = board.cell_at(2,2)
      expect(alive).to_not be_dead
    end

    it "can tell you how many live cells it has" do
      s = <<~EOF
        💩💩💩
        💩🤩💩
        💩💩💩
      EOF
      board = Board.from_string(s)
      expect(board.alive_count).to eq(1)
    end

    it "can tell you how many live cells it has, part deux" do
      s = <<~EOF
        💩💩💩
        💩💩💩
        💩💩💩
      EOF
      board = Board.from_string(s)
      expect(board.alive_count).to eq(0)
    end

    it "explodes" do
      s = <<~EOF
        💩💩💩
        💩💩💩
        💩💩💩
      EOF
      board = Board.from_string(s)
      expect(board.to_s).to eq(s)
    end
  end



end
