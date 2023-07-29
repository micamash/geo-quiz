<template>
  <div class="footer">
    <nav>
      <ul>
        <li>
          Created by <a href="https://github.com/micamash">Ashley Mical</a>
        </li>
        <li>&#169; 2023 World Wiz Geo Quiz</li>
      </ul>
    </nav>
  </div>
</template>

<script>
export default {};
</script>

<style scoped>
nav {
  display: flex;
  justify-content: center;
  align-items: center;
}

.footer {
  width: 100%;
  height: 30px;
  background-color: #239ecf80;
  display: flex;
  text-align: center;
  position: fixed;
  justify-content: center;
  bottom: 0;
  left: 0;
}

ul {
  display: flex;
  margin: 0px;
  justify-content: center;
  align-items: center;
  gap: 100px;
  list-style-type: none;
}

a {
  text-decoration: none;
  color: #0d3b4d;
}
</style>