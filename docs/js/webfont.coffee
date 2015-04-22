(($, FontFaceObserver) ->

  observers = []
  fontFamily = 'ITC Franklin Gothic W01'

  observers.push new FontFaceObserver fontFamily, { weight: 400 }
  observers.push new FontFaceObserver fontFamily, { weight: 600 }
  observers.push new FontFaceObserver fontFamily, { weight: 700 }

  onSuccess = () ->
    $ "body"
      .addClass 'has-webfont'

  Promise.all observers.map((observer) -> observer.check())
    .then onSuccess, null

)(jQuery, FontFaceObserver)

#! Copyright AXA Versicherungen AG 2015