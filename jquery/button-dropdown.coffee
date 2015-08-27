(($) ->

  # Public class definition
  class ButtonDropdown

    constructor: (element, options) ->
      @$element = $ element
      # @options = $.extend {}, options

      @$button = @$element.find '.button-dropdown__button'
      @$pane = @$element.find '.button-dropdown__pane'
      @$actions = @$element.find '.button-dropdown__action'

      @$button.on 'click', @, (event) ->
        event.data.toggle event

      @$actions.on 'click', @, (event) ->
        event.data.toggle event

    toggle: () ->
      @$pane.toggleClass 'is-active'

  # Plugin definition
  Plugin = (option) ->
    params = arguments

    return this.each () ->
      options = $.extend({}, data, typeof option == 'object' && option)
      action = option if typeof option == 'string'

      $this = $ this
      data = $this.data('axa.buttonDropdown')

      if not data
        data = new ButtonDropdown this, options
        $this.data 'axa.buttonDropdown', data

  # Plugin registration
  $.fn.buttonDropdown = Plugin
  $.fn.buttonDropdown.Constructor = ButtonDropdown

  # DATA-API
  $(window).on 'load', () ->
    $('[data-button-dropdown]').each () ->
      $buttonDropdown = $(this)
      Plugin.call($buttonDropdown)

)(jQuery)

#! Copyright AXA Versicherungen AG 2015
