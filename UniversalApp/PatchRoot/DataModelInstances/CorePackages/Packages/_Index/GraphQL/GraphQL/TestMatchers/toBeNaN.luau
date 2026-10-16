local Number = require(script.Parent.Parent.Parent.LuauPolyfill).Number

return function(p1) --[[ Line: 17 | Named "toBeNaN" ]]
	-- upvalues: Number (copy)
	local IsNaN = Number.isNaN(p1)
	
	return if IsNaN then { pass = IsNaN } else {
		pass = false,
		message = ("expected: NaN (number), got: \"%s\" (%s) instead"):format(tostring(p1), (typeof(p1)))
	}
end