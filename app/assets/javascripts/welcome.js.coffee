paintIt = (element, backgroundColor, textColor) ->
  element.style.backgroundColor = backgroundColor
  if textColor?
    element.style.color = textColor
$ ($)->
  $('.random-button').attr("disabled",null).click (e)->
    e.preventDefault()
    select = $(e.target).parent().find('select')
    options = select.find('option')
    val = options.eq(Math.floor(options.length * Math.random())).val()
    select.val val
