local MagicMockModule = require(script.Parent.Parent.MagicMock)

return function(p1) --[[ Line: 4 ]]
	-- upvalues: MagicMockModule (copy)
	local IsResult = MagicMockModule.is(p1)
	
	return {
		pass = IsResult,
		message = if IsResult then "Expected object to be anything but a MagicMock." else string.format("Expected object to be a MagicMock. Got %q instead.", (tostring(p1)))
	}
end