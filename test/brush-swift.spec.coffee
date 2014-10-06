require 'coffee-errors'

fs = require 'fs'
chai = require 'chai'
expect = chai.expect
parser = require 'parser'

(typeof window isnt 'undefined' and window or global)
  .SyntaxHighlighter =
    Highlighter: require 'brush-base'
    XRegExp: require 'xregexp'
    Match: require('parser/lib/match').Match,
    regexLib: require 'regex-lib'
    brushes: {}

{Brush} = require '..'

SAMPLE = fs.readFileSync "#{__dirname}/../SAMPLE", 'utf8'
console.log SAMPLE

describe 'brush-swift', ->
  instance = null

  before ->
    instance = new Brush()

  it 'has populated code sample', ->
    expect(SAMPLE).to.not.match /^Populate/

  describe 'instance', ->
    it 'has `regexList`', ->
      expect(instance).to.have.property 'regexList'

  describe 'parsing', ->
    matches = null

    before ->
      matches = parser.parse SAMPLE, instance.regexList

    it 'can parse', ->
      expect(matches).to.have.length.above 0
