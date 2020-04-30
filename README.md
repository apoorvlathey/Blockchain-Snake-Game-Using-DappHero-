# Blockchain Snake Game (Using DappHero)
Score Higher than the Rest and Win Crypto! | [Rinkeby Demo](https://apoorvlathey.com/projects/BlockchainSnakeGame/)

Video Demo: [YouTube](https://youtu.be/cBSaPn-Pdh0)

![](https://i.imgur.com/RWyIiuT.png)

Combining the Classic Snake game and the latest technology: Blockchain, this game aims to reward crypto to the Players that score better than the rest.

In order to start the match, the player deposits .001 ETH into the Game Pool and begins the game. On biting the snake's tail or hitting the wall, the game ends and the score is sent to the Game's Smart Contract. If the player's score is greater than the current overall Player Average than he is rewarded with .001 ETH (initial deposit) + 1% winning prize (0.00001 ETH). Losers lose entire 1 ETH to the Game Pool.

The entire blockchain interaction is handled via DappHero, game logic in phaser.js.

The game follows a unique concept to maintain balance:
If the OverallAverageScore to beat is lower, then the players can easily win emptying out our Prize Pool one-by-one, but because in order to win, the score must be higher than the Total Average Score. This means that with each new win the target to beat (Overall Average) keeps on increasing meaning that it becomes more difficult for each following player. This means more less-skilled players would now lose, losing their 1 ETH deposit thereby maintaining a balance between Prize Pool Reserves and Score To Beat.

![](https://i.imgur.com/F7UJiq8.png)
