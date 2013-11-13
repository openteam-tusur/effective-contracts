$ ->
  $('.need_autocomplete.for_emails').autocomplete({
    source: '/users'
    delay: 200
    select: (evt, ui) ->
      $('#permission_user_id').val(ui.item.id)
  })

