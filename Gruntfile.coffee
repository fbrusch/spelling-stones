module.exports = (grunt) ->
    grunt.initConfig(
        less:
            glob_to_multiple:
                expand: true
                cwd: 'less/'
                src: ['*.less']
                dest: 'css/'
                ext: '.css'
        coffee:
            options:
                bare: true
            glob_to_multiple:
                expand: true
                cwd: 'coffee'
                src: ['*.coffee']
                dest: 'js/'
                ext: '.js'
        jade:
            options:
                pretty: true
            glob_to_multiple:
                expand: true
                cwd: 'jade'
                src: ['*.jade']
                dest: '.'
                ext: '.html'
        regarde:
            coffee:
                files: '**/*.coffee'
                tasks: ['coffee']
            jade:
                files: '**/*.jade'
                tasks: ['jade']
            less:
                files: '**/*.less'
                tasks: ['less']
    )
    grunt.loadNpmTasks "grunt-contrib-coffee"
    grunt.loadNpmTasks "grunt-contrib-jade"
    grunt.loadNpmTasks "grunt-contrib-less"
    grunt.loadNpmTasks "grunt-regarde"
    grunt.registerTask "build",["jade","coffee","less"]
    grunt.registerTask "watch","regarde"
    grunt.registerTask "server","Start the app server", () ->
        grunt.log.writeln "Starting web server on 9001",
            require("./server.coffee").listen(9001)

