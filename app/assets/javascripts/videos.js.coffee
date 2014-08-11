# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
update_size = ->
  $("#vjs_video_3").css("width", $(window).width() - 228).css("height", $(window).height() - 142)

window.videos_ready = ->
  setTimeout( ->
      videojs("vjs_video_3").ready ->
        update_size()
  , 500)
  $(window).resize ->
    update_size()