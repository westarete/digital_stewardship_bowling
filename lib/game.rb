class Game

  def initialize
    @rolls = []
    @frame = []
    @curr_frame = 1
    @curr_ball = 1
    @ball_count = 0
    @game_over = 0
    @error = 0
  end

  def roll(number_of_pins)
    @rolls << number_of_pins
    @frame << @curr_frame
    @ball_count++
    if ((number_of_pins == 10) && (@curr_ball == 1) && (@curr_frame < 10)) # strike
      @curr_frame += 1 #  next frame
      @curr_ball = 1 # set to first ball
    elsif ((number_of_pins < 10) && (@curr_ball == 1) && (@curr_frame < 10))  # first ball left some pins
      @curr_ball += 1 # set to next ball
    elsif ((@curr_ball == 2) && (@rolls[@ball_count-2] + @rolls[@ball_count-1] == 10) && (@curr_frame < 10))   #spare
      @curr_frame += 1  # next frame
      @curr_ball = 1
    elsif ((@curr_ball == 2) && ((@rolls[@ball_count-2] + @rolls[@ball_count-1]) < 10) && (@curr_frame < 10))  #open frame
      @curr_frame += 1   # next frame
      @curr_ball = 1
    else (@curr_frame == 10)
      if ((number_of_pins == 10) && (@curr_ball == 1)) #strike first ball last frame
        @curr_ball += 1
      elsif  ((number_of_pins == 10) && (@curr_ball == 2)) #strike second ball last frame
        @curr_ball += 1
      elsif ((number_of_pins < 10) && (@curr_ball == 1))  #first ball left some pins
        @curr_ball += 1
      elsif ((@curr_ball == 2) && ((@rolls[@ball_count-2] + @rolls[@ball_count-1]) == 10)) # spare
        @curr_ball += 1
      elsif ((@curr_ball == 2) && (@rolls[@ball_count-2] + @rolls[@ball_count-1] < 10)) #open frame
        @game_over = 1
      elsif (@curr_ball == 3)
        @game_over = 1
      else
        @error = 1
      end
    end
  end

  def score
    total_score = 0
    total_tenth_rolls = 0

    @rolls.each_with_index do |roll, i|
      total_score += roll
      if (@frame[i] == 10)
        total_tenth_rolls += 1
      end
      if ((i > 1) && (@rolls[i-2] == 10) && (total_tenth_rolls < 3)) # strike
        total_score += @rolls[i-1] + roll
      elsif ((i > 1) && (@rolls[i-2] + @rolls[i-1] == 10) && (@frame[i-2] == @frame[i-1])  && (total_tenth_rolls < 2)) # spare
        total_score += roll
      end
    end
    total_score
  end

end
