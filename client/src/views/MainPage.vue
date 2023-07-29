<template>
  <div class="main-page">
    <MainHeader> </MainHeader>

    <div class="topic-selection">
      <p>Select a topic:</p>

      <div class="button-group">
        <div class="coming-soon">
          <input type="button" value="Countries" />
          <h2>^ Coming Soon!</h2>
        </div>

        <div class="coming-soon">
          <input type="button" value="World Landmarks" />
          <h2>^ Coming Soon!</h2>
        </div>
      </div>

      <div class="button-group">
        <div class="coming-soon">
          <input type="button" value="USA State Capitals" />
          <h2>^ Coming Soon!</h2>
        </div>

        <div class="coming-soon">
          <input type="button" value="Flags of the USA" />
          <h2>^ Coming Soon!</h2>
        </div>
      </div>

      <div class="button-group">
        <div class="coming-soon">
          <input type="button" value="Provinces and Territories of Canada" />
          <h2>^ Coming Soon!</h2>
        </div>

        <div class="coming-soon">
          <router-link to="/us-states">
            <input type="button" value="States of the USA" />
          </router-link>
        </div>
      </div>

      <div class="button-group">
        <div class="coming-soon">
          <input type="button" value="Flags of Canada" />
          <h2>^ Coming Soon!</h2>
        </div>

        <div class="coming-soon">
          <input type="button" value="Flags of the World" />
          <h2>^ Coming Soon!</h2>
        </div>
      </div>
    </div>

    <Footer></Footer>
  </div>
</template>
  
<script>
import Footer from "../components/Footer.vue";
import MainHeader from "../components/MainHeader.vue";

export default {
  components: {
    Footer,
    MainHeader,
  },
};
</script>
  
<style scoped>
.topic-selection {
  width: 500px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  text-align: center;
  background-color: #239ecfa4;
  border-radius: 10px;
  box-shadow: 0 0 5px #05050554;
  padding: 10px;
}

.topic-selection > p {
  font-weight: bold;
  text-transform: uppercase;
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

input:active {
  transform: scale(0.98);
  box-shadow: 3px 2px 22px 1px rgba(0, 0, 0, 0.24);
}

.button-group {
  display: flex;
}

.coming-soon {
  display: flex;
  flex-direction: column;
}

h2 {
  font-size: 0.7em;
  font-weight: 400;
  font-style: italic;
  margin: 0;
}

ul {
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
  margin: 5px 0;
}
</style>