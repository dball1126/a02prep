require_relative "hand"
class Player < Hand
  attr_reader :name
  attr_accessor :hand, :bankroll

  def initialize(name, bankroll)
    @name     = name
    @bankroll = bankroll
    
  end

  def pay_winnings(bet_amt)
    self.bankroll += bet_amt
  end

  def return_cards(deck)
    self.hand = nil
  end

  def place_bet(dealer, bet_amt)
  end
end
