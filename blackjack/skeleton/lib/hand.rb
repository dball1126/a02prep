require_relative 'deck'
require_relative 'card'

class Hand < Deck              # DO WE NEED THIS  ?? ?? ?? Maybe ASK
  # This is a *factory method* that creates and returns a `Hand`
  # object.
  def self.deal_from(deck)    #WHERE IS THE HAND COMING FORM??

    Hand.new(deck.take(2))
  end

  attr_accessor :cards, :deck

  def initialize(cards)
    @cards = cards
  end

  def points
    sum = 0 
    self.cards.each do |card|
      if card.value == :ace
          sum <= 10 ? sum += 11 : sum += 1
      else
          sum += card.blackjack_value
      end
    end

    sum
  end

  def busted?
    self.points > 21
  end

  def hit(deck)
    raise "already busted" if self.busted?
    @cards += deck.take(1) 
  end

  def beats?(other_hand)
    return false if self.busted?
    return true if other_hand.busted?
    self.points > other_hand.points
  end

  def return_cards(deck)
    deck.return(self.cards)
    self.cards = []
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
