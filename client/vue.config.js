const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
  transpileDependencies: true
})


module.exports = {
  configureWebpack: {
    resolve: {
      alias: {
        'axios': 'axios/dist/axios.min.js'
      }
    }
  }
};