import Vue from 'vue';
import VueRouter from 'vue-router';
import MainPage from '../views/MainPage.vue';
import USStatesQuiz from '../views/USStatesQuiz.vue';
import ProvincesAndTerritoriesOfCanadaQuiz from '../views/ProvincesAndTerritoriesOfCanadaQuiz.vue';

Vue.use(VueRouter)

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'MainPage',
      component: MainPage,
    },
    {
      path: '/us-states',
      name: 'USStatesQuiz',
      component: USStatesQuiz
    },
    {
      path: '/provinces-and-territories-of-canada',
      name: 'ProvincesAndTerritoriesOfCanadaQuiz',
      component: ProvincesAndTerritoriesOfCanadaQuiz
    }
  ]
})

export default router;
