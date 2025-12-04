# ITCS 4230 Project 2: Totally Accurate

## Game Instructions
Navigate around the level with the goal of reaching the end. Encounter enemy types, let them run into you to engage battle sequence. In the battle, the player should choose battle options with the intent of bringing the enemy's HP to zero.

- **USE ARROW KEYS to move the player character around the overworld**

## Game Walkthrough
Press start to drop into the beta level. Explore the maze and head south to reach the end of the game level. Avoid or engage enemies while doing so. 

## Contributors
### Ayemhenre Isikhuemhen
**Computer Science Student** at University of North Carolina at Charlotte | Class of 2026<br>
Contacts: aisikhue@charlotte.edu | github.com/Taotlema

### Hunter Iler
**Digital Art Student** at University of North Carolina at Charlotte | Class of 2026<br>
Contacts: hiler@charlotte.edu

### James Stephens
**Computer Science Student** at University of South Carolina at Beaufort | Class of 2027<br>
Contacts: jsteph74@charlotte.edu | github.com/jwstephens4123-art

### Yanchen Xia
**Computer Science Student** at University of South Carolina at Beaufort | Class of 2025<br>
Contacts: yxia6@charlotte.edu | github.com/YanchenXia

## License
CC0-1.0, CC-BY-4.0, and CC-BY-SA-4.0 are open licenses used for non-software material ranging from datasets to videos. Note that Creative Commons does not recommend its licenses be used for software or hardware.

**Digital Art Assests:** Hunter Iler, November 2025, Digital(Procreate)  
**SFX/Music Assests:** Pixabay

Player Movement (rm_main)
Controls:
•	Arrow Keys: Move Shaka Zulu in all directions 
o	↑ Up Arrow - Move Up
o	↓ Down Arrow - Move Down
o	← Left Arrow - Move Left
o	→ Right Arrow - Move Right
Movement Features:
•	Shaka Zulu uses walk animation while moving
•	Returns to idle animation when stopped
•	Collide with enemies to start battle
________________________________________
Combat System (rm_battle)
Turn Order
Combat uses a speed-based turn system:
•	Character/Enemy with highest speed goes first
•	Current turn order: Napoleon (15) → Shaka Zulu (12) → Cleopatra (10) → Enemies (varies)
•	Dead characters are automatically skipped
Battle Actions
Light Attack (Sword Icon)
•	Deal normal damage to selected enemy
•	Click button → Click enemy to target
•	Builds special bar (+15% per attack)
Special Attack (Flame Icon)
•	Requires full special bar (yellow bar at top-left)
•	Shaka Zulu: 2x damage to one enemy
•	Cleopatra: Heal one ally (+50 HP) with lime particle effects
•	Napoleon: Dodge next enemy attack (shows "MISSED!" text)
Run (Arrow Icon)
•	Escape from battle immediately
•	Returns to rm_main
•	Enemy remains in world
Combat Features
•	Targeting System: Click action button, then click target (enemy or ally)
•	Cancel Targeting: Press Backspace to cancel and restore special bar
•	Visual Feedback: 
o	White flash shader when characters take damage
o	Attack animations for all characters and enemies
o	Hurt animations when damaged
o	Death animations when defeated
o	Smooth HP bar depletion using animation curves
o	Current turn character is brighter, others are dimmed
Win/Lose Conditions
•	Victory: Defeat all enemies → Confetti particle effect in win screen
•	Defeat: All party members fall → Game restarts
________________________________________
Cheat Codes
Type these codes anywhere during gameplay (no need to press Enter):
Available Cheats
FULLHEAL
•	Instantly heals all party members to max HP
•	Works in rm_main and rm_battle
MAXPOWER
•	Fills special bar to 100%
•	Allows immediate special attacks
INSTA
•	Instantly defeats all enemies
•	Only works during battle (rm_battle)
________________________________________
 Graduate Student Technical Features
Shaders
White Flash Shader (shd_flash_white)
•	Applied when characters take damage
•	Flashes character white for visual impact
•	Fades over approximately 20 frames (~0.3 seconds)
•	Uses GLSL shader with flash_amount uniform for smooth blending
Particle Effects
Healing Particles
•	Triggered by Cleopatra's special ability
•	20 lime-green star particles burst from healed character
•	Particles float outward and fade over 30-60 frames
•	System: healing_particle_system with pt_shape_star
Confetti Particles
•	Appears in win screen (rm_win)
•	Continuous confetti falling from top of screen
•	Red, yellow, and aqua colored squares
•	Uses gravity effect to simulate realistic falling
•	30% spawn chance per frame for steady flow
Animation Curves
Smooth HP Bar Depletion
•	HP bars don't instantly jump to new values
•	Uses lerp() function with 0.15 interpolation speed
•	Creates smooth animation over ~0.3 seconds
•	Applied to both player and enemy health bars
•	displayed_hp variable tracks visual HP separately from actual HP


