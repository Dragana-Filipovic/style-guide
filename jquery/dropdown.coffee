(($) ->

  # Public class definition
  class Dropdown
    @DEFAULTS

    constructor: (element, options) ->
      @$element = $ element

      @options = $.extend {}, Dropdown.DEFAULTS, options

      @init()

    init: () ->
      if !Modernizr.touchevents && typeof $.fn.selectpicker != 'undefined'
        @$element.selectpicker(@options)

  # Plugin definition
  Plugin = (option) ->
    params = arguments

    return this.each () ->
      $this = $ this
      options = $.extend({}, Dropdown.DEFAULTS, data, typeof option == 'object' && option)
      data = $this.data('axa.dropdown')

      if not data
        data = new Dropdown this, options
        $this.data 'axa.dropdown', data

  # Plugin registration
  $.fn.dropdown = Plugin
  $.fn.dropdown.Constructor = Dropdown

  # DATA-API
  $(document).on 'ready', () ->
    $('[data-dropdown]').each () ->
      $dropdown = $(this)
      data = $dropdown.data()

      Plugin.call($dropdown, data)

)(jQuery)

#! Copyright AXA Versicherungen AG 2015
