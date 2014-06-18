6.2

Edited the README file with a short description and some ideas; not finalized yet - Ling

Reformated the README file, added Main file; currently only a circle that tracks mouse movements - Fawn


6.3

Ideas for project: speed booster, point multiplier, pearl (extra points),  invulnerability, fishfood?, poisoned food (handicap - makes you swim in the reverse direction or slows you down),
lives & life boosters, combo bar ("Frenzy!" meter that will give double the points when filled up), a bar to keep track of the largest fish that can be eaten, fishing hook? & jellyfish to avoid

IF WE HAVE TIME: implement new mode "TIME ATTACK", or include sound?

Enemy variables: speed, size, color, frequency, new levels, point value, food value (how much larger does this make the fish?)

use linkedlist to keep track of current fish on screen (easier to add and/or remove) - Ling

Made Player class seperate, fixed values to more appropriate numbers for our purposes - Fawn


6.4

created enemy superclass - Ling

created TestFish class - Fawn


6.5

created eating function for the TestFish - Fawn


6.6

worked on enemy/thing classes, created the touching function - Ling

enemy fish now react to approaching player - Fawn


6.7

fixed player boundaries, worked on death/eaten behavior - Fawn


6.8

added "menu" bar, fixed boundaries accordingly; also kind of started the comboBar? - Fawn


6.9

worked on code for chasing and escaping, kind of worked on combo bar? if just drawing the outline counts - Fawn

allowed fish to increase in size, adjusted code for fish swimming away and chasing (this is still buggy!) - Ling


6.10

worked on Fish classes - Fawn

smaller fish now swim away upon approach (direction updates) - Ling


6.11

worked on combo bar - Fawn

chasing function now works! - Ling


6.12

worked on frenzy! class - Ling

more chasing things, acceleration - Fawn


6.13

worked on player death - now has three symbols to represent lives; game stops when all lives are lost - Ling

fixed speed of game, chasing finally works properly - Fawn


6.14

fixed some values and calculations, new life animation - Fawn

Created death screen; now able to restart or revive, changed start screen setup (fishies created), now keeps track of and shows score and highscore (incorporated into 'Bar,' formerly 'ComboBar', Fish now extends Enemy which extends Thing (bad edibles should extend Enemy, powerups should extend Thing), changed acceleration for Fish to make game easier - Ling

bug in the game where player dies without touching nearby fish!


6.15

fixed the death bug, level list done, colorrrrrs!, transitions between stages, win screen kind of - Fawn

THINGS LEFT TO DO:
Frenzy thing

THINGS TO DO IF WE HAVE TIME:
Temporary speed boost, multiplier, slowdown
Start/Instruction/Win screen?
Change fonts into vectors, they're a bit fuzzy
Thing on the menu bar that lets you know what you can eat/can't eat

changed the end screen so that player can play again, fixed bug where game starts on stage 3, fixed bug where player starts max size, added functionality (player invulnerable for a while after revival) - Ling


6.16

made invulnerablity longer, frenzy makes the player move a bit faster, frenzy bar doesn't increase during frenzy so the player can't get eternal frenzy, changed fonts, created bar that lets you know what you can and can't eat - Fawn

invulnerability now also works with revival and restart, added new function (revival with same size), decreased chasing radius for larger fish because game is too difficult otherwise, began work on powerups (a +1 life thing?) - Ling


6.17

start screen! - Fawn