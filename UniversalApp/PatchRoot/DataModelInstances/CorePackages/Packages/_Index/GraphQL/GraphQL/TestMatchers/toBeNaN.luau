local number = require(script.Parent.Parent.Parent.LuauPolyfill).Number

return function(p1)
	-- upvalues: number (ref)
	local var1 = number.isNaN(p1)
	
	return if var1 then { pass = var1 } else {
		pass = false,
		message = ("expected: NaN (number), got: \"%s\" (%s) instead"):format(tostring(p1), typeof(p1))
	}
end