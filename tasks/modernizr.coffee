gulp = require 'gulp'
modernizr = require 'gulp-modernizr'
sourcemaps = require 'gulp-sourcemaps'
uglify = require 'gulp-uglify'
rename = require 'gulp-rename'

errorify = require '../lib/errorify'

module.exports = ->
  gulp.src [
      './jquery/**/*'
      './less/**/*'
    ], { base: './' }
    .pipe modernizr 'modernizr.custom.js', {
      excludeTests: [
        'target'
        'progressbar' # depends on https://github.com/doctyper/customizr/issues/19
        'notification'
      ],
      options: [
        'setClasses'
      ]
    }
    .pipe gulp.dest './dist/modernizr'
    .pipe sourcemaps.init { loadMaps: true }
    .pipe uglify()
    .on 'error', errorify
    .pipe rename { extname: '.min.js' }
    .pipe sourcemaps.write('.', sourceRoot: './')
    .pipe gulp.dest './dist/modernizr'

# Copyright AXA Versicherungen AG 2015
