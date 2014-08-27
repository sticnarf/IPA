update_accessibility = ->
  slided = false
  if $("#user_user_type_validating").is(':checked')
    if $("#member_only").css("display") == "none"
      $("#member_only").slideDown()
      slided = true
  else
    $("#member_only").slideUp()

  for i in ["photo", "pub", "hp", "film", "post"]
    if $("#user_department_#{i}").is(":checked")
      if $("\##{i}_only").css("display") == "none"
        slided = true
        $("\##{i}_only").slideDown();
    else
      $("\##{i}_only").slideUp();

  if slided
    $("#container").animate({ scrollTop: $("#container form").height() }, "slow")
    slided = false

add_option = (name) ->
  new_dom = $("#new_#{name}")
  add_dom = $("#add_#{name}")
  value = $.trim(new_dom.val())
  if value.length > 0 && options[name].indexOf(value) == -1
    options[name].push(value)
    html = '<div class="large-2 columns"><label><input name="user['+name+'][]"'+'type="checkbox" value="'+value+'">'+value+'</label></div>'
    $(html).insertBefore(add_dom.parent().parent().parent())
    bind_listener()
  add_dom[0].blur()

check_checkboxes = (e) ->
  if $(e.target).parent().parent().hasClass("no_choice")
    if $(e.target).parent().parent().parent().children().length == 2
      $(e.target).prop("checked", true)
    for i in $(e.target).parent().parent().parent().children()
      unless $(i).hasClass("no_choice")
        $(i).find(":checkbox").prop("checked", false);
  else
    $(e.target).parent().parent().parent().find(".no_choice").find(":checkbox").prop("checked", false)

options = {
  photo_equipment: [],
  post_software: [],
  pub_skill: [],
  film_equipment: [],
  hp_direction: [],
  hp_tech: []
}

unbind_all = ->
  for i in Object.keys(options)
    $("#add_#{i}").unbind("click")
  $(".department_only").find(":checkbox").unbind("click")

bind_listener = ->
  unbind_all()
  for i in Object.keys(options)
    $("#add_#{i}").click (e) ->
      e.preventDefault()
      add_option($(this).attr("id").substring(4))

  $(".department_only").find(":checkbox").click (e) ->
    check_checkboxes(e)

window.registrations_ready = ->
  update_accessibility()
  bind_listener()
  $(".radio").find("input:radio").change ->
    update_accessibility()
  $(".multiple_choices").find("input:checkbox").change ->
    update_accessibility()
