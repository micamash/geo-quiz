<template>
  <div class="header">
    <router-link to="/">
      <img src="../assets/back-button.jpg" id="back-button" alt="Back arrow" />
    </router-link>
    <h1>Quiz Page</h1>
  </div>
</template>

<script>
export default {};
</script>

<style scoped>
.header {
  font-family: "Amatic SC", cursive;
  font-size: 1em;
  margin: 5px 0 5px 0;
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
</style>