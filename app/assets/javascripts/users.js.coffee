# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.delete_pic = (index) ->
  for tr in $("tbody.files tr")
    if tr.getAttribute("fileid") == index.toString()
      $(tr).remove()

window.users_ready = ->
  window.files = []
  $("input:file").change ->
    files = $(this)[0].files
    for f in files
      url = URL.createObjectURL(f)
      tr = $("<tr class='upload-file' fileid='" + window.files.length + "'></tr>")
      preview = $("<td class='preview'></td>")
      $("<img src='" + url + "'>").appendTo(preview)
      preview.appendTo(tr)
      $("<td class='file-name'>" + f.name + "</td>").appendTo(tr)
      $("<td class='file-size'>" + (f.size / 1024.0).toFixed(2) + "KB</td>").appendTo(tr)
      $("<td><button type='button' class='button small delete'>" +
        "<i class='fa fa-ban'></i><span>删除</span></button></td>").appendTo(tr)
      $("tbody.files").append(tr)
      window.files.push(f)

  $("button.start").click ->
    for tr in $("tbody.files tr")
      $.ajax {
        url: "/upload/token",
        async: false,
        success: (data) ->
          index = tr.getAttribute("fileid")
          formData = new FormData()
          formData.append("token", data["token"])
          formData.append("key", data["key"])
          formData.append("file", window.files[index])
          request = new XMLHttpRequest()
          request.open("POST", "http://upload.qiniu.com/");
          request.send(formData);
      }

    return false