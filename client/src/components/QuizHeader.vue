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
  margin: 0px 0 10px 0;
  height: 50px;
  display: flex;
  justify-content: space-between;
  align-content: center;
  width: 100vw;
  background-color: #239ecf80;
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