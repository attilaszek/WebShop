$(document).ready ->
  setTotalPrice = ->
    if document.getElementById('total_price') != null
      fields = document.getElementsByClassName 'total_price_field'
      sum = 0
      for field in fields
        sum += parseInt(field.innerHTML)
      document.getElementById('total_price').innerHTML = sum.toFixed(1)
    return
    
  setOrderItemPrice = (thisObject) ->
    quantity = thisObject[0].value
    price = thisObject.parents(':eq(2)').parent('tr').find('.price_field').html()
    total_price = quantity * price
    thisObject.parents(':eq(2)').parent('tr').find('.total_price_field').html(total_price.toFixed(1))
    return

  $('.quantity_field').click ->
    setOrderItemPrice $(this)
    console.log $(this)
    setTotalPrice()
    return

  $('.quantity_field').keyup ->
    setOrderItemPrice $(this)
    setTotalPrice()
    return

  setTotalPrice()

  for field, i in document.getElementsByClassName('quantity_field')
    field.click()