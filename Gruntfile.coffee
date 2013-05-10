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
        watch:
            coffee:
                files: '**/*.coffee'
                tasks: ['coffee', 'livereload']
                options:
                    livereload: yes
            jade:
                files: '**/*.jade'
                tasks: ['jade', 'livereload']
                options:
                    livereload: yes
            less:
                files: '**/*.less'
                tasks: ['less', 'livereload']
                options:
                    livereload: yes
    )
    grunt.loadNpmTasks "grunt-contrib-coffee"
    grunt.loadNpmTasks "grunt-contrib-jade"
    grunt.loadNpmTasks "grunt-contrib-less"
    grunt.loadNpmTasks "grunt-contrib-livereload"
    grunt.loadNpmTasks "grunt-contrib-watch"
    grunt.registerTask "build",["jade","coffee","less"]
    grunt.registerTask "default", ["build", "server", "watch"]
    grunt.registerTask "server","Start the app server", () ->
        grunt.log.writeln "Starting web server on 9001",
            require("./server.coffee").listen(9001)

