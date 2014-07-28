# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
update_height = ->
  if $("#main").length > 0
    $("#main").height($("body").height() - $("header").height() - $("footer").height())

update_height()
$(window).resize ->
  update_height()