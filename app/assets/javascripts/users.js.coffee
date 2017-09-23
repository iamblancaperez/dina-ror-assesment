$('.pagination[remote=true] a').on 'click', ->
  window.history.pushState(null, 'hi', $(this).attr("href"))
  $.rails.handleRemote($(this))
  return false
  