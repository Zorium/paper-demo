z = require 'zorium'
_ = require 'lodash'

styles = require './index.styl'
styleVars = require '../../vars.json'

module.exports = class Dialog
  constructor: ({title, content, actions, onleave}) ->
    styles.use()

    @state = z.state {
      title
      content
      actions
      listeners:
        onleave: onleave
    }

  render: ({title, content, actions, listeners}) ->
    z '.z-dialog',
      z '.backdrop', onclick: listeners.onleave
      z '.dialog',
        z '.info',
          if title
            z '.title', title
          z '.content', content
        unless _.isEmpty actions
          z '.actions',
            _.pluck actions, '$el'
