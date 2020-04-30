var Menu = {

	preload : function() {
		// First arg how img referred to
		// Second arg path to file
		game.load.image('menu', './assets/images/menu.png');
	},

	create: function() {
		// // Add sprite to game. Here it's game logo
		// // Parameters are: X, Y, image name
		// this.add.sprite(0, 0, 'menu');

		// Add menu screen as button
		this.add.button(0, 0, 'menu', this.startGame, this);
	},

	startGame: function() {
		if(getStatus() === "true") {
			// change state to actual game
			this.state.start('Game');
		} else if(getStatus() === "STATUS")  {
			console.log("Wait to Load web3 data")
		} else {
			alert("Deposit ETH to Play!")
		}
	}

};