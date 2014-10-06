module.exports = (config) ->
  config.set
    frameworks: ['browserify', 'mocha', 'chai']
    browsers: if process.env.TRAVIS then ['Firefox'] else ['Chrome']

    preprocessors:
      '**/*.coffee': ['browserify']

    browserify:
      transform: ['coffeeify', 'brfs']
      extensions: ['.coffee']
      watch: true
      debug: true

    files: [
      'test/**/*.spec.coffee'
    ]
