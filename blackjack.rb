require_relative 'deck'

class Hand
attr_accessor :cards, :score

  def initialize(cards)
    @cards = cards
    @score = 0
  end

  def calculate_hand
    #take out suit. substitute letters into 10.

    @cards.map! do |card|
        card.gsub!(/[♦♣♠♥]/, '')
      if (card == "J") || (card == "K") || (card == "Q")
        @score += card.gsub!(/[JQK]/, '10').to_i
      elsif card == "A"
        if @score > 10
          @score += card.gsub!("A", '1').to_i
        else
          @score += card.gsub!("A", '11').to_i
        end
      else
        @score += card.to_i
      end
    end
      return @score
  end
end

deck = Deck.new
cards = deck.deal(2)
hand = Hand.new(cards)
# hand.calculate_score
# Get this working properly
