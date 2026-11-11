local _ = require(script.Parent.types)

return function(StartingValue)
	return {
		step = function()
			-- upvalues: StartingValue (copy)
			return { complete = true, value = StartingValue }
		end,
		startingValue = StartingValue
	}
end