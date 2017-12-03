# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  $('.nav li').click ->
    $('.nav li').removeClass 'active'
    $('.nav div').attr("aria-expanded","false");
    $('.nav div').attr("class","collapse");
    $(this).addClass 'active'
    return

$(document).ready ->
  category_id = $("#active-category-id-variable").html()
  sub_category_id = $("#active-sub-category-id-variable").html()
  $(".nav div#menu#{category_id}").prev().attr("class", "active")
  $(".nav div#menu#{category_id}").attr("aria-expanded","true");
  $(".nav div#menu#{category_id}").attr("class","collapse in");
  $(".nav div #sub-category#{sub_category_id}").addClass 'li-marked'
