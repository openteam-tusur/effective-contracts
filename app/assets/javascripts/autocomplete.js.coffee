$ ->
  $(document).on("focus",".need_autocomplete", ->
    $('.need_autocomplete').autocomplete({
      source: "/lecturers"
      delay: 200
      select: (evt, ui) ->
        $(this).val(ui.item.label)
        true
    })
    )

