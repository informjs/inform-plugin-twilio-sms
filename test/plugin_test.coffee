{Plugin} = require '../src'
twilio = require 'twilio'

{expect} = require 'chai'

sinon = require 'sinon'
_ = require 'lodash'

exampleData =
  options:
    sid: 'example_sid'
    token: 'example_token'
    destination: '1 (801) 448-1862'
    from: '1 (801) 448-1862'

describe 'Plugin', ->
  it 'should define #receive', ->
    expect(Plugin.prototype.receive).to.not.equal undefined

  describe '#constructor', ->
    it 'should set options to the first provided argument', sinon.test ->
      plugin = new Plugin exampleData.options

      expect(plugin.options).to.deep.equal exampleData.options

    it 'should verify that required options have been provided', sinon.test ->
      brokenPluginFactory = (without) ->
        return ->
          brokenData =  _.omit exampleData.options, without

          new Plugin brokenData

      withoutSID = brokenPluginFactory 'sid'
      withoutToken = brokenPluginFactory 'token'
      withoutDestination = brokenPluginFactory 'destination'
      withoutFrom = brokenPluginFactory 'from'

      expect(withoutSID).to.throw Error
      expect(withoutToken).to.throw Error
      expect(withoutDestination).to.throw Error
      expect(withoutFrom).to.throw Error

    it 'should create a Twilio client', sinon.test ->
      spy = @spy twilio, 'RestClient'

      new Plugin exampleData.options

      expect(spy.calledOnce).to.be.true
      expect(spy.calledWithNew()).to.be.true
      expect(spy.calledWith exampleData.options.sid, exampleData.options.token).to.be.true
