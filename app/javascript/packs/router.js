import Vue from 'vue';
import Router from 'vue-router';

import job from './components/job';

Vue.use(Router);

export default new Router({
	mode: 'history',
	base: '/app', // might make this just '/' and keep '/api' for api routes
	routes: [
		{
			path: '/jobs',
			name: 'job',
			component: job,
		},
		{
			path: '/tasks',
			name: 'todo',
			// route level code-splitting
			// this generates a separate chunk (about.[hash].js) for this route
			// which is lazy-loaded when the route is visited.
			component: () =>
				import(/* webpackChunkName: "todo" */ './components/task.vue'),
		},
	],
});
