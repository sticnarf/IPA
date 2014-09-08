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

masonrize = ->
  msnry = new Masonry('#photo_container', {
    itemSelector: '.box',
    gutter: 10,
  })
  imagesLoaded($('#photo_container'), ->
    msnry.layout()
  )
  $(document).foundation()

window.albums_ready = ->
  fix_pagination()
  fix_pagination_a()
  masonrize()
  $.ajax(document.location.href + "/photos").done( (data) ->
    $(data).appendTo($("#photo_container"))
    masonrize()
  )
  page = 1
  can_next = true
  $("#container").scroll ->
    if can_next
      scroll = $("#container").scrollTop()
      if $("#photo_container").height() - $("#container").height() - scroll < 100
        page += 1
        $.ajax(document.location.href + "/photos?page="+page).done( (data) ->
          if data == 'No more.'
            can_next = false
          else
            $(data).appendTo($("#photo_container"))
            masonrize()
        )




