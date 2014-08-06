# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
update_position = ->
  $(".owl-pagination").css("top", $(".owl-carousel").offset().top + $(".owl-item img").height() - $(".owl-pagination").height())
  $(".owl-pagination").css("left", $(".owl-carousel").offset().left + $(".owl-item img").width() + 25)

update_size = ->
  $(".item").find("img").height($("body").height() - 222)
  $(".item").find("p").height($(".item").find("img").height() - $(".owl-pagination").height() - 25)
  $(".item").find("p").width($("#container").width() - $(".item").find("img").width() - 301)

update = ->
  $(".owl-carousel").owlCarousel {
    autoPlay: 5000,
    singleItem: true,
    paginationNumbers: true,
    transitionStyle: "fade"
  }
  update_size()
  update_position()

window.welcome_ready = ->
  setInterval( ->
    update()
  , 50)