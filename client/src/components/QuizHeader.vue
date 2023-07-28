<template>
  <div class="header">
    <router-link to="/">
      <img
        src="../../public/back-button.jpg"
        id="back-button"
        alt="Back arrow"
      />
    </router-link>
    <h1>{{ pageTitle }}</h1>
  </div>
</template>

<script>
export default {
  props: {
    pageTitle: {
      type: String,
      required: true,
    },
  },
};
</script>

<style scoped>
.header {
  font-family: "Amatic SC", cursive;
  font-size: 1em;
  margin: 0px 0 10px 0;
  height: 50px;
  display: flex;
  justify-content: flex-start;
  align-content: center;
  width: 100vw;
  gap: 10px;
}

#back-button {
  width: 50px;
}

h1 {
  margin: 5px 0 0 0;
}
</style>