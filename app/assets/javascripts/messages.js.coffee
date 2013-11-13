$ ->
  flash_message = $('.message_wrapper:visible')
  flash_message.on 'click', ->
    flash_message.clearQueue().slideUp()
  flash_message.delay(4000).slideUp()
