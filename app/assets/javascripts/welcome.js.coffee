paintIt = (element, backgroundColor, textColor) ->
  element.style.backgroundColor = backgroundColor
  if textColor?
    element.style.color = textColor
$ ($)->
  $('.random-button').attr("disabled",null)
  $(document).on 'click','.random-button', (e)->
    e.preventDefault()
    select = $(e.target).parent().find('select')
    options = select.find('option')
    val = options.eq(Math.floor(options.length * Math.random())).val()
    select.val val
  search = (str,select,result)->
    result.empty()
    if str.length is 0
      return
    select.find("option:contains('#{str}')").each ()->
      op = $(this)
      anchor = $('<a>')
      anchor.attr
        href:"#"
        "data-value":op.val()
        style:"display:block"
      anchor.text(op.text())
      anchor.click (e)->
        a = $(this)
        e.preventDefault()
        select.val(a.data('value'))
      anchor.appendTo(result)
    if (anchors = result.find('a')).length is 1
      anchors.first().click()
  $(document).on 'keyup', 'input.search',(e)->
    e.preventDefault()
    select = $(e.target).parent().find('select')
    result = $(e.target).parent().find('.result')
    search $(this).val(),select,result

  $(document).on 'keydown','input.search', (e)->
    if e.keycode is 13
      e.preventDefault()
      $(e.target).parent().find('.result a').first().click()

