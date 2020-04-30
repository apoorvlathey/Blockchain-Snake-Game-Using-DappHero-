var game;

// create new game instance 600px wide and 450px tall
game = new Phaser.Game(600, 450, Phaser.AUTO, '');  //phaser.auto is renderer type.

// First param, how state will be called
// Second param, obj containing needed methods for state functionality
game.state.add('Menu', Menu);

game.state.start('Menu');

// adding the game state
game.state.add('Game', Game);

game.state.start('Menu');

game.state.add('Game_Over', Game_Over);