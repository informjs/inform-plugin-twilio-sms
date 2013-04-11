{Plugin} = require 'inform-shared'

console.dir Plugin

class ExamplePlugin extends Plugin
  receive: (message) -> console.log message

module.exports.Plugin = ExamplePlugin

