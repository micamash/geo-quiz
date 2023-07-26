<template>
  <!DOCTYPE html>
  <html lang="en">
    <head>
      <meta charset="UTF-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <link rel="stylesheet" href="/css/quiz-page-styles.css" />
      <link rel="preconnect" href="https://fonts.googleapis.com" />
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
      <link
        href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,400;0,700;1,400&display=swap"
        rel="stylesheet"
      />
      <link rel="preconnect" href="https://fonts.googleapis.com" />
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
      <link
        href="https://fonts.googleapis.com/css2?family=Amatic+SC:wght@400;700&family=Raleway:ital,wght@0,400;0,700;1,400&display=swap"
        rel="stylesheet"
      />
      <title>Quiz</title>
    </head>

    <body>
      <header>
        <router-link to="/">
          <img
            src="../assets/back-button.jpg"
            id="back-button"
            alt="Back arrow"
          />
        </router-link>
        <h1>Quiz Page</h1>
      </header>

      <main>
        <!-- <img src="https://placehold.co/600x400" alt="Image hint for question" /> -->
        <img :src="question.imageUrl" alt="Image hint for question" />

        <form @submit.prevent="submitAnswer">
          <!-- <p>This is the question!</p> -->
          <p>{{ question.questionText }}</p>
          <!-- <div class="radio-group">
            <label>
              <input type="radio" name="stateQuestion" value="Answer 1" />
              Answer 1
            </label>
            <label>
              <input type="radio" name="stateQuestion" value="Answer 2" />
              Answer 2
            </label>
            <label>
              <input type="radio" name="stateQuestion" value="Answer 3" />
              Answer 3
            </label>
            <label>
              <input type="radio" name="stateQuestion" value="Answer 4" />
              Answer 4
            </label>
          </div>
          <input type="submit" value="Submit" /> -->
          <div class="radio-group">
            <label v-for="(answerOption, index) in answerOptions" :key="index">
              <input
                type="radio"
                :name="stateQuestion"
                :value="answerOption.answerText"
                v-model="selectedAnswer"
              />
              {{ answerOption.answerText }}
            </label>
          </div>
          <input type="submit" value="Submit" />
        </form>
      </main>

      <footer>
        <nav>
          <ul>
            <li>
              Created by <a href="https://github.com/micamash">Ashley Mical</a>
            </li>
            <li>&#169; 2023 World Wiz Geo Quiz</li>
          </ul>
        </nav>
      </footer>
    </body>
  </html>
</template>

<script>
import QuestionService from "../services/QuestionService.js";
import AnswerService from "../services/AnswerService.js";

export default {
  name: "USStatesQuiz",
  data() {
    return {
      question: null,
      answerOptions: [],
      selectedAnswer: null,
    };
  },
  async created() {
    try {
      this.question = await QuestionService.getRandomQuestion();
      this.answerOptions = this.question.answers;
    } catch (error) {
      console.error("Error fetching question:", error);
    }
  },
  methods: {
    async submitAnswer() {
      if (this.selectedAnswer) {
        const isCorrect = await AnswerService.validateUserAnswer(
          this.question.questionId,
          this.selectedAnswer
        );

        if (isCorrect) {
          console.log("Correct answer!");
        } else {
          console.log("Wrong answer!");
        }
      } else {
        console.log("Please select an answer.");
      }
    },
  },
};
</script>


<style>
header {
  font-family: "Amatic SC", cursive;
  font-size: 1.1em;
  margin: 10px 0 5px 0;
  display: flex;
  justify-content: space-between;
  width: 500px;
}

#back-button {
  width: 50px;
}

body > header > a {
  font-family: "Amatic SC", cursive;
  font-size: 2.5em;
  color: black;
}

h1 {
  margin: 5px;
}

main {
  width: 500px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  text-align: center;
  background-color: #239ecf7a;
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
  flex-direction: column;
  align-items: center;
  margin-right: 140px;
}

label {
  display: flex;
  align-items: center;
}

li {
  list-style-type: none;
  margin: 0px;
}

a {
  text-decoration: none;
  color: #0f4964;
}

footer {
  width: 100%;
  height: 30px;
  background-color: #aaffc173;
  display: flex;
  text-align: center;
  position: fixed;
  justify-content: center;
  bottom: 0;
  left: 0;
}
</style>