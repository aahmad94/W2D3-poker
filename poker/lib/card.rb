class Card

CARDS = {
  2 => :one,
  3 => :three,
  4 => :four,
  5 => :five,
  6 => :six,
  7 => :seven,
  8 => :eight,
  9 => :nine,
  10 => :ten,
  11 => :jack,
  12 => :queen,
  13 => :king,
  14 => :ace
}
attr_reader :face, :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
    @face = "#{CARDS[value]}, #{suit}"
  end

end


# def render
#   @hand.each do |el|
#     print "| #{el.face} |"
#   end
# end
