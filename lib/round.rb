class Round
  attr_reader :deck, :turns
  attr_accessor :current_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards[turns.count]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    @current_card = deck.cards[turns.count]
    @turns[turns.count -1]
  end

  def number_correct
    @turns.count { |turn| turn.correct? }
  end

  def number_correct_by_category(category)
    @turns.count { |turn| turn.correct? && turn.card.category == category }
  end

  def percent_correct
    number_correct.to_f / @turns.count * 100
  end

  def percent_correct_by_category(category)
    number_correct_by_category(category) /
    (@turns.count { |turn| turn.card.category == category }.to_f) * 100
  end

end
