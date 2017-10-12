require "rspec"
require "card"
require "deck"

RSpec.describe Card do
  describe "#initialize" do
    subject(:card) { Card.new(13, "♡") }
    context "sets card value, suit, and face" do
      it "sets a card value" do
        expect(card.value).to eq(13)
      end
      it "sets a card suit" do
        expect(card.suit).to eq("♡")
      end
      it "sets a card face" do
        expect(card.face).to eq("king, ♡")
      end
    end
  end
end

RSpec.describe Deck do
  subject(:deck) { Deck.new }
  describe "#initialize" do
    it "sets deck with 52 cards" do
      expect(deck.deck.length).to eq(52)
    end

    it "#deck has 52 unique cards" do
      unique_test = deck.deck.map { |el| [el.value, el.suit] }
      expect(unique_test).to eq(unique_test.uniq)
    end
  end

  describe "#shuffle" do
    it "shuffles the deck" do
      deck2 = Deck.new
      expect(deck2.deck).to_not eq(deck.shuffle)
    end
  end
end
