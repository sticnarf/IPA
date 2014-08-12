window.update_position_all = update_position_all = ->
  $("#main").height($("body").height() - $("header").height() - $("footer").height())
  if $("aside .pointer").length > 0
    $("aside .pointer").css("left", $("aside .active").offset().left - 10)
    $("aside .pointer").css("top", $("aside .active").offset().top + $("aside .active").height() / 2 - 5)
  $("#nav_user").css("left", $("body").width() - $("#panel_nav").width() - 30)

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

bind_listener_all = ->
  $(window).on('resize', ->
    $("#container .pointer").css("left", $("header nav .active").offset().left - 5 + $("header nav .active").width() / 2)
    update_position_all()
  )
  $('aside').on('scroll', ->
    update_position_all()
  )
  move_pointer()
  $("#container .pointer").css("left", $("header nav .active").offset().left - 5 + $("header nav .active").width() / 2)

ready = ->
  #alert("global ready")
  $("#nav_"+$("#header_nav").attr("active")).css("visibility", "visible").find("a").addClass("active").bind('click', false)
  update_position_all()
  bind_listener_all()
  move_pointer()
  eval("window."+$("body").attr("class")+"_ready()")

$ ->
  $(document).foundation()

$(document).ready(ready)