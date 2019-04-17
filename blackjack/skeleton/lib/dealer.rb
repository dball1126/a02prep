require_relative 'player'

class Dealer < Player
  attr_reader :name
  attr_accessor :bets

  def initialize
    super("dealer", 0)
    @bets = {}
  end

  def place_bet(dealer, amt)
      raise "Dealer doesn't bet" 
  end

  def play_hand(deck)
      until self.hand.busted? || self.hand.points >= 17    ## self.busted? || self.points >= 17  
        self.hand.hit(deck)                            #    self.hit(deck)     DOES THIS WORK NORMALLY IS IT ONLY FAILING BECAUSE OF THE SPECS
      end
  end

  def take_bet(player, amt)
    self.bets[player] = amt
  end

  def pay_bets
    bets.each do |player, amt|
      if player.hand.beats?(self.hand)
         player.pay_winnings(amt * 2)
      end
    end
  end
end
