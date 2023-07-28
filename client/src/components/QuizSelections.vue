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

<style>
.quiz-selections {
  margin-top: 200px;
  background-color: #239ecf;
  border-radius: 10px;
  box-shadow: 0 0 5px #05050554;
  padding: 10px;
}
</style>