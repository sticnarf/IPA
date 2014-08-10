update_accessible = ->
  if $("#user_user_type_validating").is(':checked')
    $("#user_class_name").removeAttr("disabled")
    $("#user_qq").removeAttr("disabled")
  else
    $("#user_class_name").attr("disabled", "disabled")
    $("#user_qq").attr("disabled", "disabled")

window.registrations_ready = ->
  update_accessible()
  $(".radio").find("input:radio").change ->
    update_accessible()
