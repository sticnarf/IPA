# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
update_size = ->
  $("#vjs_video_3").css("width", $(window).width() - 228).css("height", $(window).height() - 142)

fix_pagination = ->
  index = $(".page.current").text()
  $(".page.current").text("")
  $("<a>"+index+"</a>").appendTo($(".page.current"))
  $(".pagination").css("margin-left", 114 - $(".pagination").width() / 2)

fix_pagination_a = ->
  $(".page a").click (e) ->
    e.preventDefault()
    $.ajax({
      url: $(this).attr("href"),
      type: "GET",
      success: (data) ->
        $("aside").html(data)
        fix_pagination()
        fix_pagination_a()
        window.update_position_all()
      timeout : 1500
    })

window.videos_ready = ->
  setTimeout( ->
      videojs("vjs_video_3").ready ->
        update_size()
  , 500)
  fix_pagination()
  fix_pagination_a()
  $(window).resize ->
    update_size()