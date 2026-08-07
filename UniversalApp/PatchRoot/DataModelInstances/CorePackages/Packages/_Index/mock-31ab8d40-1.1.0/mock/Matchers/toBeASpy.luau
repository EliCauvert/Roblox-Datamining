local spyModule = require(script.Parent.Parent.Spy)

return function(p0) --[[ line: 4 ]]
	-- upvalues: spyModule (ref)
	local var1 = spyModule.is(p0)
	
	return {
		pass = var1,
		message = if var1 then "Expected object to be anything but a Spy." else string.format("Expected object to be a Spy. Got %q instead.", tostring(p0))
	}
end