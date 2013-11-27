$ ->
  $(document).on("focus",".need_autocomplete", ->
    $('.need_autocomplete').autocomplete({
      source: "/lecturers"
      delay: 200
      select: (evt, ui) ->
        console.log(ui)
        $('.need_autocomplete').val(ui.item.author)
    })
    )

