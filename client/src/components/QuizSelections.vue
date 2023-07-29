<template>
  <div class="quiz-selections">
    <h2>Select the number of questions:</h2>
    <select v-model="selectedQuestionCount">
      <option value="5">5 Questions</option>
      <option value="10">10 Questions</option>
      <option value="25">25 Questions</option>
      <option value="50">50 Questions</option>
    </select>
    <button @click="startGame">Submit</button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      selectedQuestionCount: "5",
    };
  },
  methods: {
    startGame() {
      this.$emit("start-game", parseInt(this.selectedQuestionCount, 10));
    },
  },
};
</script>

<style scoped>
.quiz-selections {
  margin-top: 100px;
  background-color: #239ecf;
  border-radius: 10px;
  box-shadow: 0 0 5px #05050554;
  padding: 10px;
}

h2 {
  margin: 10px;
}

button {
  margin: 10px 20px;
  background: linear-gradient(#8aefa7, #559d6a);
  border: none;
  border-radius: 10px;
  box-shadow: 0 0 5px #05050554;
  padding: 5px;
  cursor: pointer;
  height: 25px;
  width: 75px;
  margin: 5px 10px;
}

button:active {
  transform: scale(0.98);
  box-shadow: 3px 2px 22px 1px rgba(0, 0, 0, 0.24);
}

select {
  border-radius: 10px;
  background-color: #7ed5f7;
  border: none;
  box-shadow: 0 0 5px #05050554;
}
</style>