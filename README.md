pd1-FishEatFish-Ling-Fawn
=========================

**Group Members:**
Ling Dong, Fawn Wong
Period 1

**Description:** 
A game based off of feeding frenzy using processing

**Instructions:**
-1. In terminal, type in "processing Main.pde" OR open file from a folder
0. Click Run (play symbol)
* Use your mouse to control the white fish. NOTE: There is acceleration!
* Eat smaller fish to grow bigger and score points.
* The bigger the fish you eat, the more points you get.
* If you are eaten by a fish larger than you, you lose a life.
* Certain events make you invulnerable. The fishes will glow if you are.
* Lose all three lives and game over.
* Eat the powerups to gain a random booster
* When you reach a certain size, you move on to the next level.
* Eat enough fish in a short period and you go into a frenzy! You temporarily speed up and get a score bonus.

**What works:**
* Random fish loading onto screen
* Fish run away / chase you depending on size
* Transition animations between levels
* Display that shows what you can and cannot eat
* Frenzy bar
* Life "bar"
* New life animations
* invulnerability : after death/new level/etc, you will be invulnerable for a limited time. However, you will also be unable to eat during this time.
* Score and high score counts
* Start screen
* Restart level, restart game options
* Powerups!
  The flashing dots are powerups and can always be eaten, though harder to catch
      They give a random effect, in order of most common to least..
      	   1) +1 health (nothing happens if you have 3 lives)
	   2) temporary invulnerability
	   3) temporary speed boost
	   4) score multiplier

**What doesn't:**
* Screen occasionally flashes when you eat something and there are too many fish on the screen

**Data structures used:**
We used a linked list to structure the different levels of the game.
