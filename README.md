# The Bowling Game

This is an exercise in unit testing with RSpec. We are creating a library
that knows how to score a game of bowling. We are to produce a class `Game`
with two methods: `#roll(number_of_pins)` and `#score`.

## The Rules

_Courtesy of Uncle Bob Martin_

![Bowling scoring example](https://github.com/westarete/digital_stewardship_bowling/raw/master/doc/scoring.png "Mark it zero, Smokey.")

The game consists of 10 frames as shown above.  In each frame the player has
two opportunities to knock down 10 pins.  The score for the frame is the total
number of pins knocked down, plus bonuses for strikes and spares.

A spare is when the player knocks down all 10 pins in two tries.  The bonus for
that frame is the number of pins knocked down by the next roll.  So in frame 3
above, the score is 10 (the total number knocked down) plus a bonus of 5 (the
number of pins knocked down on the next roll.)

A strike is when the player knocks down all 10 pins on his first try.  The
bonus for that frame is the value of the next two balls rolled.

In the tenth frame a player who rolls a spare or strike is allowed to roll the
extra balls to complete the frame.  However no more than three balls can be
rolled in tenth frame.

## Contributing

1. Clone the repository.
2. Check out the "end-of-seminar" branch to make sure you're starting at the same
   point as everyone else.
3. Create your own branch named after yourself.
4. Develop your solution.
5. Push your branch.
6. Send a pull request to share your solution with everyone else.

