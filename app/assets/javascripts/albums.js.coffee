# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
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

window.albums_ready = ->
  fix_pagination()
  fix_pagination_a()