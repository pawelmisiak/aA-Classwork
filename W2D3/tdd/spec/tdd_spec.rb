# require 'rspec'
require 'tdd'

describe "New_Array" do

  describe "#my_uniq" do
    let(:test_array) { [1,2,1,3,3]}

    it "removes duplicates from the array" do
      expect(test_array.my_uniq).to eq(test_array.uniq)
    end

    it "returns elements in the order they first appeared" do
      expect([4,1,1,1,3,3,2,2].my_uniq).to eq([4,1,3,2])
    end
  end

  describe '#two_sum' do
    let(:test_array) { [-1,0,2,-2,1] }
    let(:result) { test_array.two_sum }

    it "finds all pairs of positions that sum to zero" do
      expect(result).to eq([[0,4],[2,3]])
    end

    it "sorts smaller index before bigger index" do
      expect(result[0][0]).to be < (result[0][1])
    end

    it "sorts the pairs of the elements dictionary-wise" do
      expect(result).to eq(result.sort_by {|pair| pair.first})
    end

    it "does not include 0 + 0" do
      expect([0,-3,0,0,4,0,1].two_sum).to eq([])
    end
  end

  describe '#my_transpose' do
    let(:test_array) {[
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
    ]}
    let(:result) { test_array.my_transpose }

    it "transposes rows and columns"  do
      expect(result).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
    end

    it "returns an empty array" do
      expect([].my_transpose).to eq([])
    end

  end

  describe "#stock_picker" do
    let(:test_array) {[25.60, 34.80, 27.45, 100.00, 1.51]}
    let(:result) { test_array.stock_picker }

    it "returns an array of a pair of days" do
      expect(result).to be_an_instance_of(Array)
      expect(result.all? {|day| day.is_a?(Integer)}).to be true
    end

    it "returns an earlier day before a later day" do
      expect(result).to eq(result.sort)
    end

    it "returns the days on which it would be most profitable to buy and sell" do
      expect(result).to eq([0,3])
    end

    context "when market is bad" do
      it "returns an empty array" do
        expect([3.0,2.4,2.2,1.3,1.0,0.5].stock_picker).to eq([])
      end
    end
  end

end

describe "#towers_of_hanoi" do
  subject(:game) {TowersOfHanoi.new("Bob")}

  describe "#initialize" do

    it "initializes the game with three arrays and three discs in the first array" do
      expect(game.board).to eq([[1,2,3],[],[]])
    end
    it "initializes the game with a player name" do
      expect(game.player).to eq("Bob")
    end
  end

  describe "#move" do
    it "moves disc from one tower to another one" do
      game.move(0,1)
      expect(game.board).to eq([[2,3],[1],[]])
    end

    context "when trying to put heavier disc on top of the lighter" do
      it "raises an error" do
        game.move(0,1)
        expect{ game.move(0,1) }.to raise_error(InvalidMoveError)
      end
    end

    context "when trying take a disc from an empty tower" do
      it "raises an error" do
        expect{ game.move(2,1) }.to raise_error(InvalidMoveError)
      end
    end

    context "when trying to start or end off the board" do
      it "raises an error" do
        expect{ game.move(4, -1) }.to raise_error(InvalidMoveError)
      end
    end
  end

  describe "#won?" do
    let (:winning_board1) { [[],[1,2,3],[]]}
    let (:winning_board2) { [[],[],[1,2,3]]}
    let (:non_winner) { [[1,2,3], [], []] }

    it "returns false if discs are in proper order on starting tower" do
      game.board = non_winner
      expect(game).not_to be_won
    end

    it "returns true if discs in proper order on tower 1" do
      game.board = winning_board1
      expect(game).to be_won
    end

    it "returns true if discs in proper order on tower 2" do
      game.board = winning_board2
      expect(game).to be_won
    end

  end

end
