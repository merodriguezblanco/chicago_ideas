$(document).ready ->
  $('a#inline').fancybox
  autoDimensions: true
  autoScale: true
  padding: 0
  margin: 0
  showCloseButton: false
  hideOnContentClick: false
  hideOnOverlayClick: false
  centerOnScroll: true

  $('div.thank_you_close_button') .live "click", ->
    $.fancybox.close()
