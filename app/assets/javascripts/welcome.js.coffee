# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.update_position = update_position = ->
  if $("#main").length > 0
    $("#main").height($("body").height() - $("header").height() - $("footer").height())
  $("aside .pointer").css("left", $("aside .active").offset().left - 10)
  $("aside .pointer").css("top", $("aside .active").offset().top + $("aside .active").height() / 2 - 5)
  $("#container .pointer").css("left", $("header nav .active").offset().left - 5 + $("header nav .active").width() / 2)
  $(".owl-pagination").css("top", $(".owl-carousel").offset().top + $(".owl-item img").height() - $(".owl-pagination").height())
  $(".owl-pagination").css("left", $(".owl-carousel").offset().left + $(".owl-item img").width() + 25)
  $("#panel_nav").css("left", $("body").width() - $("#panel_nav").width() - 30)

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

window.update_size = update_size = ->
  $(".item").find("img").height($("body").height() - 222)
  $(".item").find("p").height($(".item").find("img").height() - $(".owl-pagination").height() - 25)
  $(".item").find("p").width($("#container").width() - $(".item").find("img").width() - 301)

ready = ->
  $(".owl-carousel").owlCarousel {
    autoPlay: 5000,
    singleItem: true,
    paginationNumbers: true,
    transitionStyle: "fade"
  }
  move_pointer()
  update_size()
  update_position()
  $(window).resize ->
    update_size()
    update_position()
  $("aside").scroll ->
    update_position()

$(document).ready(ready)
$(document).on('page:load', ready)