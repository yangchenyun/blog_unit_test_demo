calculator = (method, numbers...) ->
  switch method
    when 'multiple' then @multiple(numbers)
    when 'addition' then @addition(numbers)
    when 'minus' then @minus(numbers)
    when 'divide' then @divide(numbers)
    else
      throw new Error "method doesn't exist"

multiple = (numbers) ->
  if numbers.length <= 1
    throw new Error 'multiple takes more than one operands'
  else
    numbers.reduce (prev, curr) ->
      prev * curr

addition = (numbers) ->
  if numbers.length <= 1
    throw new Error 'addition takes more than one operands'
  else
    numbers.reduce (prev, curr) ->
      prev + curr

minus = (numbers) ->
  if numbers.length isnt 2
    throw new Error 'minus takes only two operands'
  else
    numbers[0] - numbers[1]

divide = (numbers) ->
  if numbers.length isnt 2
    throw new Error 'divide takes only two operands'
  else
    numbers[0] / numbers[1]

module.exports = 
  calculator: calculator
  multiple: multiple
  addition: addition
  minus: minus
  divide: divide
