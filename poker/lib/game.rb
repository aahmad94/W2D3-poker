class Game

  attr_reader :deck

  def initialize(*players)
    @deck = Deck.new
  end

  def play
    setup
    until round_over

    end
  end

  def setup
    @deck.shuffle!
    deck.deal(5, )
  end

end

# Game.new(player1, player2, player3)

if __FILE__ == $0
  puts "How many players will be playing?"
  num_players = gets.chomp.to_i


end
