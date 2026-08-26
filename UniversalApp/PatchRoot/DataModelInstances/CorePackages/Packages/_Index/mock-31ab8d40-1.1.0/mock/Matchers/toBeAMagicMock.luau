local magicMockModule = require(script.Parent.Parent.MagicMock)

return function(p1)
	-- upvalues: magicMockModule (ref)
	local var1 = magicMockModule.is(p1)
	
	return {
		pass = var1,
		message = if var1 then "Expected object to be anything but a MagicMock." else string.format("Expected object to be a MagicMock. Got %q instead.", tostring(p1))
	}
end