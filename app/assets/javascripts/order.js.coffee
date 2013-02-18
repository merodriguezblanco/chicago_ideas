$(document).ready ->

  $('div.thank_you_close_button') .live "click", ->
    $.fancybox.close()
    window.location.href = $('.hidden_new_order').attr('data-root')

  $('#new_order').live('ajax:success', (xhr, data, status) ->
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
    $main_header = $('#wrapper > #main_header').detach()
    $('#wrapper').empty()
    $('#wrapper').html($main_header).append(data.responseText)
