class Game

  def initialize
    @rolls = []
  end

  def roll(number_of_pins)
    @rolls << number_of_pins
    if number_of_pins == 10 # strike
      @rolls << 0  # skip to next frame
    end
  end

  def score
    total_score = 0
    @rolls.each_with_index do |roll, i|
      total_score += roll
      if i.odd? # end of frame
        if @rolls[i-3] == 10 # strike
          total_score += @rolls[i-1] + roll
        elsif (@rolls[i-3] + @rolls[i-2]) == 10 # spare
          total_score += @rolls[i-1]
        end
      end
    end
    total_score
  end

end
