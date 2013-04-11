{Plugin} = require 'inform-shared'

class ExamplePlugin extends Plugin
  receive: (message) -> console.log message

module.exports.Plugin = ExamplePlugin

