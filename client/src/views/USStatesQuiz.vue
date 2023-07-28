<template>
  <body>
    <QuizHeader :pageTitle="pageName"> </QuizHeader>

    <div v-if="!gameStarted">
      <QuestionSelections @start-game="onStartGame" />
    </div>

    <div v-else>
      <main v-if="!gameOver">
        <img
          class="question-img"
          :src="question.imageName"
          alt="Image hint for question"
        />

        <form @submit.prevent="submitAnswer">
          <p>{{ question.questionText }}</p>

          <div class="radio-group">
            <div class="radio-container">
              <label
                v-for="(answerOption, index) in leftOptions"
                :key="index"
                :class="getAnswerClass(answerOption.answerText)"
              >
                <input
                  type="radio"
                  name="stateQuestion"
                  :value="answerOption.answerText"
                  v-model="selectedAnswer"
                  :disabled="isAnswered"
                />
                {{ answerOption.answerText }}
              </label>
            </div>

            <div class="radio-container">
              <label
                v-for="(answerOption, index) in rightOptions"
                :key="index"
                :class="getAnswerClass(answerOption.answerText)"
              >
                <input
                  type="radio"
                  name="stateQuestion"
                  :value="answerOption.answerText"
                  v-model="selectedAnswer"
                  :disabled="isAnswered"
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
          :maxScore="maxScore"
        />
      </main>
      <div v-else class="game-end">
        <h2>Game Over!</h2>
        <p>Your final score is: {{ score }}/{{ totalRounds * 5 }}</p>
        <button class="play-again" @click="restartGame">Play Again?</button>
      </div>
    </div>
    <Footer></Footer>
  </body>
</template>
  
  <script>
import QuestionService from "../services/QuestionService.js";
import AnswerService from "../services/AnswerService.js";
import QuestionSelections from "../components/QuizSelections.vue";
import Score from "../components/Score.vue";
import QuizHeader from "../components/QuizHeader.vue";
import Footer from "../components/Footer.vue";

export default {
  name: "USStatesQuiz",
  components: {
    QuestionSelections,
    Score,
    QuizHeader,
    Footer,
  },
  data() {
    return {
      pageName: "US States Quiz",
      question: "",
      answerOptions: [],
      selectedAnswer: null,
      topicId: 3,
      totalRounds: 20,
      roundNumber: 1,
      score: 0,
      gameOver: false,
      isAnswered: false,
      isAnsweredCorrectly: false,
      gameStarted: false,
      maxScore: 100,
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

        this.isAnswered = true;

        if (isCorrect) {
          this.score += 5;
          this.isAnsweredCorrectly = true;
        } else {
          this.isAnsweredCorrectly = false;
        }
      } else {
        this.isAnswered = false;
      }

      setTimeout(() => {
        this.isAnswered = false;
        this.isAnsweredCorrectly = false;

        this.selectedAnswer = null;

        this.roundNumber++;
        if (this.roundNumber <= this.totalRounds) {
          this.loadData();
        } else {
          this.gameOver = true;
        }
      }, 1000);
    },

    getAnswerClass(answerOption) {
      if (this.isAnswered && answerOption === this.selectedAnswer) {
        return this.isAnsweredCorrectly ? "correct-answer" : "wrong-answer";
      }
      return "";
    },

    onStartGame(questionCount) {
      this.totalRounds = questionCount;
      this.roundNumber = 1;
      this.score = 0;
      this.maxScore = questionCount * 5;
      this.gameStarted = true;
      this.loadData();
    },

    restartGame() {
      this.roundNumber = 1;
      this.score = 0;
      this.gameOver = false;
      this.isAnswered = false;
      this.isAnsweredCorrectly = false;
      this.selectedAnswer = null;
      this.gameStarted = false;
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
  border-radius: 20px;
}

.question-img {
  box-shadow: 0 0 5px #05050554;
}

input,
.play-again {
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
  width: 175px;
  border-radius: 10px;
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

.correct-answer {
  background-color: #92fa80a2;
}

.wrong-answer {
  background-color: #f56e6e9c;
}

.game-end {
  margin-top: 200px;
  background-color: #239ecf;
  border-radius: 10px;
  box-shadow: 0 0 5px #05050554;
  padding: 10px;
}
</style>