require 'spec_helper'
require './lib/frame'

describe Frame do
  let (:frame) { Frame.new }


  context "API" do
    describe '#roll' do
      it "exists" do
        frame.respond_to?(:roll).should == true
      end
      it "takes a number of pins" do
        frame.roll(0)
      end
    end

    describe '#roll_one' do
      it "exists" do
        frame.respond_to?(:roll_one).should == true
      end
    end

    describe '#strike?' do
      it "exists" do
        frame.respond_to?(:strike?).should == true
      end
    end

    describe '#spare?' do
      it "exists" do
        frame.respond_to?(:spare?).should == true
      end
    end

    describe '#complete?' do
      it "exists" do
        frame.respond_to?(:complete?).should == true
      end
    end

    describe '#roll_total' do
      it "exists" do
        frame.respond_to?(:roll_total).should == true
      end
    end
  end

  context "incomplete frame" do
    before do
      frame.roll(5)
    end

    describe '#strike?' do
      it "returns false" do
        frame.strike?.should == false
      end
    end

    describe '#spare?' do
      it "returns false" do
        frame.spare?.should == false
      end
    end

    describe '#complete?' do
      it "returns false" do
        frame.complete?.should == false
      end
    end

    describe '#roll_total' do
      it "returns 7" do
        frame.roll_total.should == 5
      end
    end

  end

  context "gutter frame" do
    before do
      frame.roll(0)
      frame.roll(0)
    end

    describe '#strike?' do
      it "returns false" do
        frame.strike?.should == false
      end
    end

    describe '#spare?' do
      it "returns false" do
        frame.spare?.should == false
      end
    end

    describe '#complete?' do
      it "returns true" do
        frame.complete?.should == true
      end
    end

    describe '#roll_total' do
      it "returns 0" do
        frame.roll_total.should == 0
      end
    end

  end

  context "frame with out a mark" do
    before do
      frame.roll(5)
      frame.roll(2)
    end

    describe '#strike?' do
      it "returns false" do
        frame.strike?.should == false
      end
    end

    describe '#spare?' do
      it "returns false" do
        frame.spare?.should == false
      end
    end

    describe '#complete?' do
      it "returns true" do
        frame.complete?.should == true
      end
    end

    describe '#roll_total' do
      it "returns 7" do
        frame.roll_total.should == 7
      end
    end

  end

  context "frame with strike" do
    before do
      roll_strike
    end

    describe '#strike?' do
      it "returns true" do
        frame.strike?.should == true
      end
    end

    describe '#spare?' do
      it "returns true" do
        frame.spare?.should == false
      end
    end

    describe '#complete?' do
      it "returns true" do
        frame.complete?.should == true
      end
    end

    describe '#roll_total' do
      it "returns 10" do
        frame.roll_total.should == 10
      end
    end
    describe '#roll_one' do
      it "returns 10" do
        frame.roll_one.should == 10
      end
    end

  end

  context "frame with spare" do
    before do
      roll_spare
    end

    describe '#strike?' do
      it "returns false" do
        frame.strike?.should == false
      end
    end

    describe '#spare?' do
      it "returns true" do
        frame.spare?.should == true
      end
    end

    describe '#complete?' do
      it "returns true" do
        frame.complete?.should == true
      end
    end

    describe '#roll_total' do
      it "returns 10" do
        frame.roll_total.should == 10
      end
    end

  end

  def roll_spare
    frame.roll(5)
    frame.roll(5)
  end

  def roll_strike
    frame.roll(10)
  end

end