require 'rspec'
require_relative '../lib/problems.rb'

RSpec.describe Array do

  describe '#my_uniq' do
    it "returns the unique elements in the order in which they first appeared" do
      array = [1, 2, 3, 1, 2, 3]
      expect(array.my_uniq).to eq([1, 2, 3])
    end
  end

  describe '#two_sum' do
    it "finds all pairs of positions where the elements at those positions sum to zero" do
      array = [1, 0, -1]
      expect(array.two_sum).to eq([[0, 2]])
    end

    context "ordering matters - We want each of the pairs to be sorted smaller index before bigger index" do
      it "orders smaller index before bigger index" do
        array = [1, 2, -2, -1]
        expect(array.two_sum).to eq([[0, 3], [1, 2]])
        expect(array.two_sum).to_not eq([[1, 2], [0, 3]])
      end
    end

  end

  describe '#my_transpose' do
    it "will convert between the row-oriented and column-oriented representations" do
      rows = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8]
      ]

      expect(rows.my_transpose).to eq(rows.transpose)
    end
  end

  describe '#stock_picker' do
    it "outputs the most profitable pair of days on which to first buy the stock and then sell the stock" do
      array = [2, 4, 6, 4, 9, 1]
      expect(array.stock_picker).to eq([0, 4])
    end
  end

end


RSpec.describe TowersOfHanoi do
  subject(:towersofhanoi) { TowersOfHanoi.new }
  describe '#move' do
    it 'moves a disc from the top of a tower and puts it on top another tower' do
      towersofhanoi.move(0, 2)
      expect(towersofhanoi.towers).to eq([[3, 2],[],[1]])
    end
  end

  describe '#won?' do
    it "checks if all disks have moved to either tower 1 or tower 2" do
      towersofhanoi.move(0, 2)
      towersofhanoi.move(0, 1)
      towersofhanoi.move(2, 1)
      towersofhanoi.move(0, 2)
      towersofhanoi.move(1, 0)
      towersofhanoi.move(1, 2)
      towersofhanoi.move(0, 2)
      expect(towersofhanoi.won?).to be_truthy
    end
  end


end
