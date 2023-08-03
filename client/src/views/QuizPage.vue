<template>
  <body>
    <QuizHeader :pageTitle="pageName"> </QuizHeader>
    <Question :topicId="topicId"></Question>
    <Footer></Footer>
  </body>
</template>
    
    <script>
import QuizHeader from "../components/QuizHeader.vue";
import Question from "../components/Question.vue";
import Footer from "../components/Footer.vue";

export default {
  name: "QuizPage",
  components: {
    QuizHeader,
    Question,
    Footer,
  },
  data() {
    return {
      pageName: "",
      topicId: null,
      pageNames: {
        1: "US State and Territory Flags",
        2: "Countries",
        3: "States of the USA",
        4: "US State and Territory Capitals",
        5: "Provinces and Territories of Canada",
        6: "World Landmarks",
        7: "Flags of Canada",
        8: "Canada Province and Territory Capitals",
      },
    };
  },
  created() {
    this.topicId = parseInt(this.$route.params.topicId);
    this.pageName = this.pageNames[this.topicId] || "Quiz";
  },
};
</script>
    
    
<style scoped>
</style>