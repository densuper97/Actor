# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#@paintIt = (element, backgroundColor, textColor) ->
#  element.style.backgroundColor = backgroundColor
#  if textColor?
#    element.style.color = textColor

@autoSubmit = (element) ->
  element.form.submit()

@showEnterField = (elementToHide, elementToShow) ->
  $(elementToHide).hide()
  $('#' + elementToShow).show()

@inchConverter = (value_sm) ->
  buf = value_sm * 0.393701
  foots = Math.floor(Math.round(buf)/12)
  inches = Math.round(buf - foots * 12) 
  result = foots.toString() + "'" + inches.toString() + "\""
  $("#outputINCH").text( result )

  
$(document).ready ->
   $("#outputINCH").text( (parseFloat($("#span_height").html()) * 0.393701).toFixed(0) )
  $("#outputq").text( (parseFloat($("#span_height").html()) * 0.393701).toFixed(0) )