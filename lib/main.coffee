module.exports = aEventFormatFn = (e, options={}) ->

  options.enable ?= "on"

  options.disable ?= "off"

  if typeof e is "string"

    if @?[e]

      e =

        name: e

        enable: options.enable

        disable: options.disable

        callback: @[e].bind @

      e.args = [ e.name, e.callback ]

      return e

  if typeof e?.name is "string" and

  typeof e?.callback is "function"

    e.enable ?= options.enable

    e.disable ?= options.disable

    e.args ?= [ e.name, e.callback ]

    return e

  throw new Error "invalid event definition #{e}"
