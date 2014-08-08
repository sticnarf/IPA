# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
update_position = ->
  if $(".owl-pagination").length > 0
    $(".owl-pagination").css("top", $(".owl-carousel").offset().top + $(".owl-item img").height() - $(".owl-pagination").height())
    $(".owl-pagination").css("left", $(".owl-carousel").offset().left + $(".owl-item img").width() + 25)

update_size = ->
  $(".item").find("img").height($(window).height() - 222)
  $(".item").find("p").height($(".item").find("img").height() - $(".owl-pagination").height() - 25)
  $(".item").find("p").width($("#container").width() - $(".item").find("img").width() - 93)

update = ->
  setTimeout( ->
    update_size()
  , 100)
  setTimeout( ->
    update_position()
  , 100)

window.welcome_ready = ->
  $(".owl-carousel").owlCarousel {
    autoPlay: 5000,
    singleItem: true,
    paginationNumbers: true,
    transitionStyle: "fade"
  }
  $(".class").click ->
    setTimeout( ->
      update()
    , 100)
  update()
  $(window).on('resize', ->
    update()
  )