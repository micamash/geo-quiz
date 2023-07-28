<template>
  <body>
    <QuizHeader> </QuizHeader>

    <main v-if="!gameOver">
      <img :src="question.imageName" alt="Image hint for question" />

      <form @submit.prevent="submitAnswer">
        <p>{{ question.questionText }}</p>

        <div class="radio-group">
          <div class="radio-container">
            <label v-for="(answerOption, index) in leftOptions" :key="index">
              <input
                type="radio"
                name="stateQuestion"
                :value="answerOption.answerText"
                v-model="selectedAnswer"
              />
              {{ answerOption.answerText }}
            </label>
          </div>

          <div class="radio-container">
            <label v-for="(answerOption, index) in rightOptions" :key="index">
              <input
                type="radio"
                name="stateQuestion"
                :value="answerOption.answerText"
                v-model="selectedAnswer"
              />
              {{ answerOption.answerText }}
            </label>
          </div>
        </div>
        <input type="submit" value="Submit" />
      </form>

      <score
        :currentRound="roundNumber"
        :totalRounds="totalRounds"
        :currentScore="score"
        :maxScore="100"
      />
    </main>
    <div v-else>
      <h2>Game Over!</h2>
      <p>Your final score is: {{ score }}/{{ totalRounds * 5 }}</p>
      <button class="play-again">Play Again?</button>
    </div>

    <Footer></Footer>
  </body>
</template>
  
  <script>
import QuestionService from "../services/QuestionService.js";
import AnswerService from "../services/AnswerService.js";
import Score from "../components/Score.vue";
import QuizHeader from "../components/QuizHeader.vue";
import Footer from "../components/Footer.vue";

export default {
  name: "USStatesQuiz",
  components: {
    Score,
    QuizHeader,
    Footer,
  },
  data() {
    return {
      question: "",
      answerOptions: [],
      selectedAnswer: null,
      topicId: 3,
      totalRounds: 20,
      roundNumber: 1,
      score: 0,
      gameOver: false,
    };
  },
  async created() {
    this.loadData();
  },
  computed: {
    leftOptions() {
      return this.answerOptions.slice(0, 2);
    },
    rightOptions() {
      return this.answerOptions.slice(2, 4);
    },
  },
  methods: {
    loadData() {
      QuestionService.getRandomQuestion(this.topicId)
        .then((response) => {
          this.question = response.data;
          return AnswerService.getAnswersByQuestionId(this.question.questionId);
        })
        .then((answersResponse) => {
          this.answerOptions = answersResponse.data;
        })
        .catch((error) => {
          console.error("Error fetching data:", error);
        });
    },

    async submitAnswer() {
      if (this.selectedAnswer) {
        const isCorrect = await AnswerService.validateUserAnswer(
          this.question.questionId,
          this.selectedAnswer
        );

        if (isCorrect) {
          console.log("Correct answer!");
          this.score += 5;
        } else {
          console.log("Wrong answer!");
        }
      } else {
        console.log("Please select an answer.");
      }

      this.roundNumber++;
      if (this.roundNumber <= this.totalRounds) {
        this.loadData();
      } else {
        this.gameOver = true;
      }
    },
  },
};
</script>
  
  
  <style>
main {
  width: 500px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  text-align: center;
  background-color: #239ecf;
  border-radius: 10px;
  box-shadow: 0 0 5px #05050554;
  padding: 10px;
}

main > p {
  font-weight: bold;
  text-transform: uppercase;
}

img {
  width: 500px;
  border-radius: 10px;
}

input {
  margin: 10px 20px;
  background: linear-gradient(#8aefa7, #559d6a);
  border: none;
  border-radius: 10px;
  box-shadow: 0 0 5px #05050554;
  padding: 5px;
  cursor: pointer;
  height: 25px;
  width: 235px;
  margin: 5px 10px;
}

h2 {
  font-size: 0.8em;
  font-weight: 400;
  font-style: italic;
  margin: 0;
}

form {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.radio-group {
  display: flex;
  justify-content: center;
  margin-left: 25px;
}

.radio-container {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  margin: 5px;
  width: 50%;
}

label {
  display: flex;
  align-items: center;
  justify-content: flex-start;
  width: 150px;
}

input[type="radio"] {
  width: 20px;
  height: 20px;
  margin-right: 5px;
}

li {
  list-style-type: none;
  margin: 0px;
}

a {
  text-decoration: none;
  color: #0f4964;
}
</style>