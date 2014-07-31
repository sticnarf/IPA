# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
update_position = ->
  if $("#main").length > 0
    $("#main").height($("body").height() - $("header").height() - $("footer").height())
  $("aside .pointer").css("left", $("aside .active").offset().left - 10)
  $("aside .pointer").css("top", $("aside .active").offset().top + $("aside .active").height() / 2)
  $("#container .pointer").css("left", $("header nav .active").offset().left - 5 + $("header nav .active").width() / 2)

move_pointer = ->
  $("header nav a").mouseenter ->
    $("#container .pointer").animate({
      left: $(this).offset().left - 5 + $(this).width() / 2
    }, {
      queue: false;
      duration: 100;
    })
  $("header nav").mouseleave ->
    $("#container .pointer").animate({
      left: $("header nav .active").offset().left - 5 + $("header nav .active").width() / 2
    }, {
      queue: false;
      duration: 200;
    })

ready = ->
  update_position()
  move_pointer()
  $(window).resize ->
    update_position()

$(document).ready(ready)
$(document).on('page:load', ready)