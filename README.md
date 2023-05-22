# Whack-a-Penguin Game
This is a simple implementation of the Whack-a-Penguin game using SpriteKit framework in Swift. The game involves tapping on characters that randomly appear from their slots. The objective is to hit the enemy characters while avoiding hitting the friendly characters.

## Overview
The game consists of a main scene called GameScene and a slot representation called WhackSlot. The GameScene class manages the overall game flow, including setting up the scene, handling user touches, creating enemy characters, and managing the game score. The WhackSlot class represents individual slots where characters can appear. It handles the configuration, visibility, and interaction of the characters within the slot.

## Tools and Technology
- Swift: The programming language used for the implementation of the game.
- SpriteKit: The game development framework provided by Apple for building 2D games.
- UIKit: The framework used for user interface elements and touch handling.
- SKEmitterNode: A class provided by SpriteKit for creating and managing particle systems. It is used in this project to create a smoke particle effect when a character is hit.
- In this project, the playSoundFileNamed method from AVFoundation is used to play sound effects when characters are hit.

 ## Credits
This project was made as a part of Hacking with Swift course by Paul Hudson.
