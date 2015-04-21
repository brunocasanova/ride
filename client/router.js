
// Configure Router
Router.configure({ layoutTemplate: 'layout' });

// Home
Router.route( '/', { name: 'firstPage' });

// Pages
Router.route( '/right', { name: 'rightPage' });
Router.route( '/over_up', { name: 'overUp' });
Router.route( '/over_down', { name: 'overDown' });
Router.route( '/left', { name: 'leftPage' });
Router.route( '/cross_fade', { name: 'crossFade' });