module.exports = (grunt) ->

  grunt.initConfig

    wintersmith:
      build: {}

    "gh-pages":
      options:
        base: "build"
      src: ["**"]

  grunt.loadNpmTasks "grunt-gh-pages"
  grunt.loadNpmTasks "grunt-wintersmith"

  grunt.registerTask "deploy", ["wintersmith", "gh-pages"]
