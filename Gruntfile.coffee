module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    watch:
      coffee:
        files: ['src/coffee/**/*']
        tasks: ['coffee']
      sass:
        files: ['src/styles/**/*']
        tasks: ['sass']

    sass:
      dev:
        options:
          style: 'compressed'
          compass: true
          loadPath: [
            './node_modules/'
          ]
        files: [
          {
            expand: true
            cwd: './src/styles/'
            src: ['*.scss', '*.sass']
            dest: './docs/styles/'
            ext: '.css'
          }
        ]

    coffee:
      dev:
        files: [
          {
            expand: true
            cwd: './src/scripts/'
            src: ['**/*.coffee']
            dest: './docs/scripts/'
            ext: '.js'
          }
        ]

    copy:
      dev:
        files: [
          {
            expand: true
            cwd: './node_modules/onepage-scroll/'
            src: ['**/*.js', '**/*.css']
            dest: './docs/vendor/onepage-scroll/'
          }
          {
            expand: true
            cwd: './node_modules/csshake/dist/'
            src: ['*.css']
            dest: './docs/vendor/csshake/'
          }
        ]

  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-copy'

  grunt.registerTask 'default', ['sass', 'coffee', 'copy']
