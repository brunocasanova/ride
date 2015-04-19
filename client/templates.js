
Template.layout.rendered = function(){
	Bender.initialize( this.find( '#content-container' ) );
};

// index.js
Template.firstPage.events({
	'click #goRight': function(){
		Bender.go( '/right', {}, { animation: 'slideLeft' });
	},

	'click #goLeft': function(){
		var la = Bender.go( '/left', {}, { animation: 'slideRight' });

		console.log( la );

		Bender.go( '/left', {}, { animation: 'slideRight' });
	},

	'click #overDown': function(){
		Bender.go( '/over_down', {}, { animation: 'slideOverDown' });
	},

	'click #overUp': function(){
		Bender.go( '/over_up', {}, { animation: 'slideOverUp' });
	},

	'click #crossFade': function(){
		Bender.go( '/cross_fade', {}, { animation: 'fadeIn' });
	}
});

// down.js
Template.overDown.events({
	'click #back': function(){
		Bender.go( '/right', {}, { animation: 'slideOverDownClose' });
	}
});

// up.js
Template.overUp.events({
	'click #back': function(){
		Bender.go('/cross_fade', {}, { animation: 'slideOverUpClose' });
	}
});

//left
Template.leftPage.events({
	'click #back': function(){
		Bender.go('/over_down', {}, { animation: 'slideLeft' });
	}
});

//right
Template.rightPage.events({
	'click #back': function(){
		Bender.go('/over_up', {}, { animation: 'slideRight' });
	}
});

//fade
Template.crossFade.events({
	'click #back': function(){
		Bender.go('/', {}, { animation: 'fadeOut' });
	}
});