local number = require(script.Parent.Parent.Parent.LuauPolyfill).Number

return function(p0)
	-- upvalues: number (ref)
	local var0 = number.isNaN(p0)
	
	return if var0 then { pass = var0 } else {
		pass = false,
		message = ("expected: NaN (number), got: \"%s\" (%s) instead"):format(tostring(p0), typeof(p0))
	}
end