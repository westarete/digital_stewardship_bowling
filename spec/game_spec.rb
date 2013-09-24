require 'spec_helper'
require './lib/game'

describe Game do

  let (:game) { Game.new }

  describe '#roll' do
    it "exists" do
      game.respond_to?(:roll).should == true
    end
    it "takes a number of pins" do
      game.roll(0)
    end
  end

  describe '#score' do
    it "exists" do
      game.respond_to?(:score).should == true
    end

    context "when the game begins" do
      it "is 0" do
        game.score.should == 0
      end
    end

    context "when we roll a gutter game" do
      before do
        20.times {game.roll(0)}
      end
      it "has a score of zero" do
        game.score.should == 0
      end
    end

    context "when we roll all ones" do
      before do
        20.times {game.roll(1)}
      end
      it "has a score of 20" do
        game.score.should == 20
      end
    end

    context "when we roll one spare" do
      before do
        roll_spare
        game.roll(3)
        17.times {game.roll(0)}
      end
      it "it counts the roll after the spare twice" do
        game.score.should == 16
      end
    end

    context "when we have two rolls that add up to 10, but span a frame" do
      before do
        game.roll(3)
        game.roll(5)
        game.roll(5)
        game.roll(1)
        16.times {game.roll(0)}
      end
      it "should only count the next ball once" do
        game.score.should == 14
      end
    end

    context "when we roll a strike" do

      before do
        game.roll(10)
        game.roll(2)
        game.roll(3)
      end
      it "counts the two rolls following to be added twice" do
        game.score.should == 20
      end
    end

    context "when we roll a perfect game" do
      before do
        12.times {game.roll(10)}
      end
      it "is 300" do
        game.score.should == 300
      end
    end
    context "when we roll a strike after a spare" do
      before do
         roll_spare
         roll_strike
         8.times {roll_frame(0,0)}
      end
      it "scores 30" do
        game.score.should == 30
      end
    end
    context "when we roll a spare after a strike" do
      before do
        roll_strike
        roll_spare
        8.times {roll_frame(0,0)}
      end
      it "scores 30" do
        game.score.should == 30
      end
    end
    context "when we roll any game" do
      before do
        roll_frame(3,4)
        roll_spare
        roll_frame(4,4)
        roll_strike
        roll_spare
        roll_strike
        roll_strike
        roll_frame(4,4)
        roll_frame(4,4)
        roll_frame(4,4)
      end
      it "is 135" do
        game.score.should == 135
      end
    end
  end

  def roll_spare
    roll_frame(5, 5)
  end

  def roll_strike
    game.roll(10)
  end

  def roll_frame(roll1, roll2)
    game.roll(roll1)
    game.roll(roll2)
  end
end