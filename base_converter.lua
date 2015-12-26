function _reverse(array)
  local output = {}
  local i = #array

  while i >= 1 do
    table.insert(output, array[i])
    i = i - 1
  end

  return output
end

function _split(str, sep)
  local output = {}

  for v in string.gmatch(str, sep) do
    table.insert(output, v)
  end

  return output
end

return {
  from_base_10_to_base_x = function(n, base)
    local div = math.floor(n / base)
    local rem = n % base
    n = div
    local output = { rem }

    while div > 1 do
      div = math.floor(div / base)
      rem = n % base
      n = div
      table.insert(output, rem)
    end

    table.insert(output, div)
    return tonumber(table.concat(_reverse(output), ''))
  end,

  from_base_x_to_base_10 = function(n, base)
    local reverse = _reverse(_split(tostring(n), '.'))
    local _n = nil
    local result = 0
    local i = #reverse

    while i >=1 do
      _n = tonumber(reverse[i])
      result = result + (_n * math.pow(base, i))
      i = i - 1
    end

    return result
  end
}
