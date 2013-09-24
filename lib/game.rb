require './lib/frame'

class Game

  def initialize
    @frames = [Frame.new]
  end

  def roll( pins)
    @frames << Frame.new if @frames[current_frame].complete?
    @frames[current_frame].roll(pins)
  end

  def score
    total_score = 0
    @frames.each_with_index do | frame, i|
      total_score+= frame.roll_total
      next if (i == 0) # first roll no history to look at
      prev_frame = @frames[i-1]
      if (prev_frame.strike?)
        total_score+= frame.roll_total
        next if (i==1)  || (i>=9) # second roll and last frame
        two_prev_frame = @frames[i-2]
        if (two_prev_frame.strike?)
          total_score+= frame.roll_one
        end
      elsif (prev_frame.spare?)
        total_score+= frame.roll_one
      end
    end
    total_score
  end

  protected

  def current_frame
    @frames.count-1
  end
end