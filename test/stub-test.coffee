sample = require('../sample')
assert = require('assert')
sinon = require('sinon')

describe "calculator", ->
  before ->
    @calculator = sinon.spy sample, 'calculator'
    @multiple = sinon.stub sample, 'multiple'
    @addition = sinon.stub sample, 'addition'
    @minus = sinon.stub sample, 'minus'
    @divide = sinon.stub sample, 'divide'

  it "should throw an error if no method is matched", ->
    try
      sample.calculator('non-exist-method', 1, 2)
    catch e
      sinon.assert.threw(@calculator)

  it "should call the given method when parameter is valid", ->
    methods = ['multiple', 'addition', 'minus', 'divide']
    for method in methods
      sample.calculator(method, 1)
      sinon.assert.calledOnce(@[method])
      sinon.assert.calledWithExactly(@[method], [1])
      @[method].restore()

  after ->
    @calculator.restore()
