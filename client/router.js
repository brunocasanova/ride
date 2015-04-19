Router.configure({
	layoutTemplate: 'layout'
});

Router.route( '/', {
	name: 'firstPage'
});

Router.route( '/right', {
	name: 'rightPage'
});

Router.route( '/over_up', {
	name: 'overUp'
});

Router.route( '/over_down', {
	name: 'overDown'
});

Router.route( '/left', {
	name: 'leftPage'
});

Router.route( '/cross_fade', {
	name: 'crossFade'
});