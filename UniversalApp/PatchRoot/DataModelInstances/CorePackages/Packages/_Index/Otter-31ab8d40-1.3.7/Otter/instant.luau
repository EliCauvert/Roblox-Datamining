local _ = require(script.Parent.types)

return function(StartingValue) --[[ Line: 5 | Named "instant" ]]
	return {
		step = function() --[[ Line: 7 ]]
			-- upvalues: StartingValue (copy)
			return { complete = true, value = StartingValue }
		end,
		startingValue = StartingValue
	}
end