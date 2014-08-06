ready = ->
  $("#nav_"+$("#header_nav").attr("active")).find("a").addClass("active").bind('click', false)
  eval("window."+$("body").attr("class")+"_ready()")

$ ->
  $(document).foundation()

$(document).ready(ready)