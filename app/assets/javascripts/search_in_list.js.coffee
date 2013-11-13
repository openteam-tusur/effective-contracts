reindex = (list) ->
  res = []
  list.children('li').each (index, item) ->
    $item = $(item)
    res.push { element: $item, value: $item.text().toString().toLocaleLowerCase() }
  res

$ ->
  inputs = $('#search_query:not(.charged)')

  if inputs.length
    inputs.each (index, item) ->
      input = $(item).addClass('charged')
      list = $(input.data('list'))
      input.on 'keydown', (e) ->
        if e.keyCode == 13
          e.preventDefault()
          e.stopPropagation()
          e.stopImmediatePropagation()
      index_values = reindex(list)

      input.on 'keyup', (e) ->
        searchStr = input.val().replace(/[-[\]{}()*+?.,\\^$|#\s]/g, "\\$&").toLocaleLowerCase()
        res = []
        list.children('li').each (index, item) ->
          $(item).hide()
        for item in index_values
          do ->
            res.push item if item.value.search(searchStr) > -1
        if res.length > 0
          $('.empty', list).remove()
          for item in res
            do ->
              item.element.show()
        else
          list.append('<li class="empty">Ничего не найдено</li>')

      list.on 'changed', ->
        index_values = reindex(list)
