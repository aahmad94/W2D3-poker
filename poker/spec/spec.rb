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

  describe "#deal" do
    let(:player1) { double("player1", hand: []) }
    let(:player2) {  double("player2", hand: []) }
    it "initial deal deals 5 cards to each player" do
      deck.deal(5, player1, player2)
      expect(deck.deck.length).to eq(42)
      expect(player1.hand.length).to eq(5)
      expect(player2.hand.length).to eq(5)
    end
  end
end
