module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-karma'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-mocha-cli'

  grunt.config.init
    karma:
      options: configFile: 'karma.conf.coffee'
      test: singleRun: true

    mochacli:
      options:
        'check-leaks': true
        'compilers': ['coffee:coffee-script/register']
        'recursive': yes
        'reporter': 'spec'
        'ui': 'bdd'
        'globals': ['SyntaxHighlighter']
      test: ['test/**/*.spec.coffee']

    watch:
      options: spawn: false

      lib:
        files: ['lib/**/*.js', 'test/**/*.spec.coffee']
        tasks: ['test']

  grunt.registerTask 'test', ['mochacli', 'karma']
  grunt.registerTask 'dev', ['watch']
