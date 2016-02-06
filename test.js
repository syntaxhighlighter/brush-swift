var chai = require('chai');
var expect = chai.expect;
var match = require('syntaxhighlighter-match');
var Brush = require('./brush');
var sample = require('fs').readFileSync(`${__dirname}/sample.txt`, 'utf8');

describe('brush-swift', function() {
  var instance = null;

  before(function() {
    instance = new Brush();
  });

  it('has populated code sample', function() {
    expect(sample).to.not.match(/^Populate/);
  });

  describe('instance', function() {
    it('has `regexList`', function() {
      expect(instance).to.have.property('regexList');
    });
  });

  describe('parsing', function() {
    var matches = null;

    before(function() {
      matches = match.applyRegexList(sample, instance.regexList);
    });

    it('can parse', function() {
      expect(matches).to.have.length.above(0);
    });
  });
});