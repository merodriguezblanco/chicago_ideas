$(document).ready ->

  $('div.thank_you_close_button') .live "click", ->
    $.fancybox.close()
    window.location.href = $('.hidden_cooperative').attr('data-root')

  $('#new_cooperative_application').live('ajax:success', (xhr, data, status) ->
    $.fancybox
      content: $('#thank_you_modal')
      autoDimensions: true
      autoScale: true
      padding: 0
      margin: 0
      showCloseButton: false
      hideOnContentClick: false
      hideOnOverlayClick: false
      centerOnScroll: true
  ).live 'ajax:error', (xhr, data, status) ->
    $('#wrapper').empty()
    $('#wrapper').html(data.responseText)
