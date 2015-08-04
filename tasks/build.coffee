runSequence = require 'run-sequence'

module.exports = (cb) ->
  # TODO: parellel (without docs)?
  runSequence(
    'clean'
    'images'
    'icons'
    'icons-copy'
    'icons-svg'
    'styles'
    'jquery'
    'modernizr'
    'ng'
    'create-versions-file'
    'docs'
    cb
  )

# Copyright AXA Versicherungen AG 2015
