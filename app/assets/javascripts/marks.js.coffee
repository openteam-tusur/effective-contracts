$ ->
  $("#add").click ->
    $("#list").append("<input type='hidden' name='author[name][]' value='"+$("#factors_author_").val()+"' />")
    $("#list").append("<p>"+$("#factors_author_").val()+"</p>")
    $("#factors_author_").val("")
    $("input[name='commit']").show()
