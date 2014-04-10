module.exports = (grunt) ->
  # Project
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    bower:
      development:
        dest: "static_components/"
        js_dest: 'static_components/js',
        css_dest: 'static_components/css'

    coffee:
      development:
        files:
          'dist/pjaxify.js': 'src/pjaxify.coffee'

    uglify:
      dist:
        files:
          'dist/pjaxify.min.js': 'dist/pjaxify.js'

    watch:
      options:
        livereload: true
      coffee:
        files: ['src/*.coffee']
        tasks: ['coffee',]

    connect:
      server:
        options:
          port: 9000
          middleware: (connect, options) ->
            path = require 'path'
            return [
              connect.static(path.resolve('test')),
              connect.static(path.resolve('dist')),
              connect.static(path.resolve('static_components'))
            ]

    # Modules
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-uglify'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-contrib-connect'
    grunt.loadNpmTasks 'grunt-bower'

    # Tasks
    grunt.registerTask 'default', [
      "connect:server",
      "bower:development",
      "coffee:development",
      "watch:coffee"
    ]

    grunt.registerTask 'create_dist', [
      "coffee:development",
      "uglify:dist",
    ]
