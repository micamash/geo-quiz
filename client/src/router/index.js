import Vue from 'vue';
import VueRouter from 'vue-router';
import MainPage from '../views/MainPage.vue';
import QuizPage from '../views/QuizPage.vue';
// import USStatesQuiz from '../views/USStatesQuiz.vue';
// import ProvincesAndTerritoriesOfCanadaQuiz from '../views/ProvincesAndTerritoriesOfCanadaQuiz.vue';
// import FlagsOfTheUSAQuiz from '../views/FlagsOfTheUSAQuiz.vue';

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
      component: QuizPage
    },
    {
      path: '/provinces-and-territories-of-canada',
      name: 'ProvincesAndTerritoriesOfCanadaQuiz',
      component: QuizPage
    },
    {
      path: '/canada-province-and-territory-capitals',
      name: 'CanadaProvinceAndTerritoryCapitalsQuiz',
      component: QuizPage
    },
    {
      path: '/flags-of-the-usa',
      name: 'FlagsOfTheUSAQuiz',
      component: QuizPage
    },
    {
      path: '/flags-of-canada',
      name: 'FlagsOfCanadaQuiz',
      component: QuizPage
    },
    {
      path: '/world-flags',
      name: 'WorldFlagsQuiz',
      component: QuizPage
    },
    {
      path: '/countries',
      name: 'CountriesQuiz',
      component: QuizPage
    },
    {
      path: '/world-landmarks',
      name: 'WorldLandmarksQuiz',
      component: QuizPage
    },
    {
      path: '/us-state-capitals',
      name: 'USStateCapitalsQuiz',
      component: QuizPage
    },
    {
      path: '/flags-of-the-usa',
      name: 'FlagsOfTheUSAQuiz',
      component: QuizPage
    },
  ]
})

export default router;
