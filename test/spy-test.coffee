sample = require('../sample')
assert = require('assert')
sinon = require('sinon')

describe "calculator", ->
  before ->
    this.calculator = sinon.spy sample, 'calculator'
    this.multiple = sinon.spy sample, 'multiple'
    this.addition = sinon.spy sample, 'addition'
    this.minus = sinon.spy sample, 'minus'
    this.divide = sinon.spy sample, 'divide'

  it "should throw an error if no method is matched", ->
    try
      sample.calculator('non-exist-method', 1, 2)
    catch e
      sinon.assert.threw(this.calculator)

  it "should call the given method when parameter is valid", ->
    methods = ['multiple', 'addition', 'minus', 'divide']
    for method in methods
      sample.calculator(method, 1, 2)
      sinon.assert.calledOnce(this[method])
