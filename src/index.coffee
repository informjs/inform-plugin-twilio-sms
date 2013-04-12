{Plugin} = require 'inform-shared'

class OptionsError extends Error

class ExamplePlugin extends Plugin
  constructor: (@options) ->
    if !@options.sid?
      throw new OptionsError 'An SID must be provided to twilio-sms'

    if !@options.token?
      throw new OptionsError 'A token must be provided to twilio-sms'

  receive: (message) -> console.log message

module.exports.Plugin = ExamplePlugin

