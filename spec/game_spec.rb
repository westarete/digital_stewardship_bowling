require 'spec_helper'
require './lib/game'

describe Game do
  let(:game) { Game.new }

  describe '#roll' do
    it "exists" do
      game.respond_to?(:roll).should == true
    end
    it "takes a number of pins" do
      game.roll(0)
    end
  end

  describe '#score' do
    context "when the game begins" do
      it "is 0" do
        game.score.should == 0
      end
    end
    context "when we roll a gutter game" do
      before do
        20.times { game.roll(0) }
      end
      it "is 0" do
        game.score.should == 0
      end
    end
    context "when we roll all ones" do
      before do
        20.times { game.roll(1) }
      end
      it "is 20" do
        game.score.should == 20
      end
    end
    context "when we roll one spare" do
      before do
        roll_spare
        game.roll(3)
        17.times { game.roll(0) }
      end
      it "counts the roll after the spare twice" do
        game.score.should == 16
      end
    end
    context "when we have 2 rolls that add up to 10, but span two frames" do
      before do
        game.roll(3)
        game.roll(5)
        game.roll(5)
        game.roll(1)
        16.times { game.roll(0) }
      end
      it "just counts the pins as they are" do
        game.score.should == 14
      end
    end
    context "when we roll a strike" do
      before do
        game.roll(10)
        game.roll(2)
        game.roll(3)
        16.times { game.roll(0) }
      end
      it "counts the two rolls following the strike twice" do
        game.score.should == 20
      end
    end
  end

  def roll_spare
    game.roll(5)
    game.roll(5)
  end
end
