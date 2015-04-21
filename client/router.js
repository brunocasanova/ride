
// Configure Router
Router.configure({ layoutTemplate: 'layout' });

// Home
Router.route( '/', { name: 'firstPage' });

// Pages
Router.route( '/right', { name: 'rightPage' });

// Up
Router.route( '/over_up', { name: 'overUp' });

// Down
Router.route( '/over_down', { name: 'overDown' });

// Left
Router.route( '/left', { name: 'leftPage' });

// Fade
Router.route( '/cross_fade', { name: 'crossFade' });