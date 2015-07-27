hljs = require('highlight.js')
fm = require('front-matter')

path = require('path')
extend = require('extend')

# Simple 'fallback' for metalsmith-relative
relative = (to) ->
  from = path.dirname('/docs/page');
  return path.relative(from, to);

module.exports = (jadeLang, jadeRuntime, jadeFilters) ->
  (text, options) ->
  	# Remove front matter
    file = fm(text)

    # Render
    html = jadeLang.render(file.body, pretty: true, relative: relative)

    return html

# Copyright AXA Versicherungen AG 2015
