local base = require 'base_converter'
local format = string.format

function test(name, func)
  xpcall(function()
    func()
    print(format('[pass] %s', name))
  end, function(err)
    print(format('[fail] %s : %s', name, err))  
  end)
end

function _equal(a, b)
  return a == b
end

function assert_equal(a, b)
  assert(_equal(a, b))
end

test('should convert from base 10 to base 2', function()
  assert_equal(base.from_base_10_to_base_x(65, 2), 1000001)
end)

test('should convert from base 10 to base 8', function()
  assert_equal(base.from_base_10_to_base_x(339, 8), 523)
end)

test('should convert from base 8 to base 10', function()
  assert_equal(base.from_base_x_to_base_10(523, 8), 339)
end)

test('should convert from base 2 to base 10', function()
  assert_equal(base.from_base_x_to_base_10(101100, 2), 44)
end)
