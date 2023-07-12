<template>
  <!DOCTYPE html>
  <html lang="en">
    <head>
      <meta charset="UTF-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <link rel="stylesheet" href="css/styles.css" />
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
      <title>World Wiz Geo Quiz</title>
    </head>

    <body>
      <header>
        <h1>World Wiz Geo Quiz</h1>
      </header>

      <main>
        <p>Select a topic:</p>

        <div class="button-group">
          <div class="coming-soon">
            <input type="button" value="Countries" />
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
            <input type="button" value="Provinces of Canada" />
            <h2>^ Coming Soon!</h2>
          </div>

          <div class="coming-soon">
            <input type="button" value="World Landmarks" />
            <h2>^ Coming Soon!</h2>
          </div>
        </div>
      </main>

      <footer>
        <nav>
          <ul>
            <li>About</li>
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
export default {};
</script>

<style>
html,
body {
  font-family: "Raleway", sans-serif;
  height: 100%;
  margin: 0;
  padding: 0;
}

body {
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: center;
  text-align: center;
}

body::before {
  content: "";
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-image: url("../assets/world.jpeg");
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  z-index: -1;
}

header {
  font-family: "Amatic SC", cursive;
  font-size: 1.1em;
  margin: 20px 0 5px 0;
}

main {
  width: 500px;
  display: flex;
  flex-direction: column;
  justify-content: center;
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

.button-group {
  display: flex;
}

.coming-soon {
  display: flex;
  flex-direction: column;
}

h2 {
  font-size: 0.8em;
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

li {
  list-style-type: none;
  margin: 0 25px;
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