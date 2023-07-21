import Vue from 'vue';
import VueRouter from 'vue-router';
import MainPage from '../views/MainPage.vue';
import USStatesQuiz from '../views/USStatesQuiz.vue';

Vue.use(VueRouter);

const routes = [
    {
        path: '/',
        name: 'MainPage',
        component: MainPage,
    },
    {
        path: '/us-states',
        name: 'USStatesQuiz',
        component: USStatesQuiz
    }
    // Other quiz routes will go here!
];

export default new VueRouter({
    mode: 'history',
    routes
});
