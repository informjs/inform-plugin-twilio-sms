{Plugin} = require '../src'
{expect} = require 'chai'

sinon = require 'sinon'
_ = require 'lodash'

exampleData =
  options:
    sid: 'example_sid'
    token: 'example_token'

describe 'Plugin', ->
  it 'should define #receive', ->
    expect(Plugin.prototype.receive).to.not.equal undefined

  describe '#constructor', ->
    it 'should set options to the first provided argument', sinon.test ->
      plugin = new Plugin exampleData.options

      expect(plugin.options).to.deep.equal exampleData.options

    it 'should verify that authentication information has been provided', sinon.test ->
      brokenPluginFactory = (without) ->
        return ->
          brokenData =  _.omit exampleData.options, without

          new Plugin brokenData

      withoutSID = brokenPluginFactory 'sid'
      withoutToken = brokenPluginFactory 'token'

      expect(withoutSID).to.throw Error
      expect(withoutToken).to.throw Error

