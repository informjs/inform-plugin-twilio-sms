twilio = require 'twilio'

{Plugin} = require 'inform-shared'

class OptionsError extends Error

class TwilioPlugin extends Plugin
  constructor: (@options) ->
    if !@options.sid?
      throw new OptionsError 'An SID must be provided to twilio-sms'

    if !@options.token?
      throw new OptionsError 'A token must be provided to twilio-sms'

    if !@options.destination?
      throw new OptionsError 'A destination must be provided to twilio-sms'

    if !@options.from?
      throw new OptionsError 'A from option must be provided to twilio-sms'

    @client = new twilio.RestClient @options.sid, @options.token

  receive: (message) =>
    @client.sms.messages.create
      to: @options.destination
      from: @options.from
      body: message

module.exports.Plugin = TwilioPlugin
