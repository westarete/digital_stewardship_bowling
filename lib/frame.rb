class Frame
  def initialize
    @rolls = []
  end

  def roll( pins)
    @rolls << pins
  end
  def strike?
    return false if @rolls.count ==0
    @rolls[0]==10
  end
  def spare?
    return false if @rolls.count <2
    roll_total == 10
  end
  def complete?
    roll_total == 10 || @rolls.count ==2
  end

  def roll_total
    return 0 if @rolls.count == 0
    @rolls.inject(:+)
  end

  def roll_one
    @rolls[0]
  end
end