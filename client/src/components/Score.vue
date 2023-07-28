<template>
  <div class="score-bar">
    <p class="round">Round: {{ currentRound }} of {{ totalRounds }}</p>
    <p class="score">Score: {{ currentScore }}/{{ maxScore }}</p>
  </div>
</template>

<script>
export default {
  name: "Score",
  props: {
    currentRound: {
      type: Number,
      required: true,
    },
    totalRounds: {
      type: Number,
      required: true,
    },
    currentScore: {
      type: Number,
      required: true,
    },
    maxScore: {
      type: Number,
      required: true,
    },
  },
};
</script>


<style scoped>
.score-bar {
  display: flex;
  gap: 50px;
}

p {
  font-weight: bold;
}
</style>