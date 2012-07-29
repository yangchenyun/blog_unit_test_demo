sample = require('../sample')
assert = require('assert')
sinon = require('sinon')

describe "calculator", ->
  before ->
    @calculator = sinon.spy sample, 'calculator'
    @mock = sinon.mock(sample)
    methods = ['multiple', 'addition', 'minus', 'divide']
    for method in methods
      @mock.expects(method).once().withArgs([1]).returns({})

  it "should throw an error if no method is matched", ->
    try
      sample.calculator('non-exist-method', 1, 2)
    catch e
      sinon.assert.threw(@calculator)

  it "should call the given method when parameter is valid", ->
    methods = ['multiple', 'addition', 'minus', 'divide']
    for method in methods
      sample.calculator(method, 1)

  after ->
    @mock.verify()
    @mock.restore()
    @calculator.restore()
