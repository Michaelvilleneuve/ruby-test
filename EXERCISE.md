# Your mission

We need to make a little role-player game to pass the time at lunch, but nobody was able to do it properly at Livestorm. We really count on you, as lunch is a very important meal for us.

## Features

This game should include a few features we wish to have:

- It must be all written in english
- You must be able to move in different directions
- There should be a few rooms to get in, and events happening in it
- We need a final room to fight our arch enemy
- Don't forget the help section to remember the commands

## Technical specifications

- It should be written in Ruby
- The game should work flawlessly
- It must be fully tested through the gem of your choice

Spend as much time as you need to build it up, it doesn't have to be too complicated but we want to be impressed by your ingenuity in tackling this project. **As time limit if you need one, a few hours should be way enough for you to write up a [small] working product.**

## What do we judge?

- The overall quality and readability of the code
- The way you structure the project. Don't write everything in one file
- The time complexity of your algorithms
- The quality of your tests
- The design patterns you strategically use or not

# Getting started

You can start off by creating a new file `game.rb` (or whatever name pleases you) and put this in it:

```ruby
require 'readline'

while input = Readline.readline('> ', true)
  break if input == 'exit'
end
```

By launching `ruby game.rb` we should be able to navigate and play the game. It will be working through REPL entirely. **You don't necesarrily have to use `readline`, what counts is that we can use your game through any console.** I've written this to make a starting point to the project, taking it or not is up to you.

## Example

```

> Hi John, ready to go on our adventure? (yes/no)
yes
> You're about to enter the dungeon, where do we go first? (right/left/forward)
right
> Risky move I see, you're now in the first room to the right but it was empty, should we pursue? (forward/backward)
forward
> Oh my god, you're facing Giggly Giggle, your arch enemy, what will you do? (hit/run)
run
> You tried to run but he kicked your ass anyway. Want to try again? (yes/no)
no
```

This is a pragmatic example of storyboard, you're free to enhance the experience with whatever comes to mind. **Don't go too far, as finishing the product is as important as adding up to its complexity**

# And then what?

Send your work at laurent@livestorm.co so we can talk about what you did.