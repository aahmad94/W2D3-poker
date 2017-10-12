require_relative "card"

class Deck

  attr_reader :deck

  def initialize
    @deck = []
    build_deck
  end

  def build_deck
    suits = ["♤", "♡", "♢", "♧"]
    suits.each do |suit|
      13.times do |num|
        @deck << Card.new(num + 2, suit)
      end
    end
  end

 def shuffle
   @deck.shuffle!
 end

 def deal(cards = 5, *players)
   players.each do |player|
     case cards
     when 5
       5.times { player.hand << @deck.pop }
     when 3
       3.times { player.hand << @deck.pop }
     when 2
       2.times { player.hand << @deck.pop }
     when 1
       1.times { player.hand << @deck.pop }
     end
   end
 end

end
