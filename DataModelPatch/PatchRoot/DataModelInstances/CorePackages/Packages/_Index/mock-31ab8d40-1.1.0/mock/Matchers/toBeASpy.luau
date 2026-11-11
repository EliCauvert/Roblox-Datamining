local SpyModule = require(script.Parent.Parent.Spy)

return function(p1)
	-- upvalues: SpyModule (copy)
	local IsResult = SpyModule.is(p1)
	
	return {
		pass = IsResult,
		message = if IsResult then "Expected object to be anything but a Spy." else string.format("Expected object to be a Spy. Got %q instead.", (tostring(p1)))
	}
end