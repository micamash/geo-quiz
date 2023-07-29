<template>
  <div class="game-end">
    <h2>Game Over!</h2>
    <p>Your final score is: {{ score }}/{{ totalRounds * 5 }}</p>
    <button class="play-again" @click="restartGame">Play Again?</button>
  </div>
</template>

<script>
export default {
  props: {
    score: {
      type: Number,
      required: true,
    },
    totalRounds: {
      type: Number,
      required: true,
    },
  },
  methods: {
    restartGame() {
      this.$emit("restart-game");
    },
  },
};
</script>

<style>
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

.play-again:active {
  transform: scale(0.98);
  box-shadow: 3px 2px 22px 1px rgba(0, 0, 0, 0.24);
}
</style>