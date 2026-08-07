local _ = require(script.Parent.types)

return function(p0) --[[ line: 5 | named "instant" ]]
	return {
		step = function() --[[ line: 7 ]]
			-- upvalues: p0 (ref)
			return { complete = true, value = p0 }
		end,
		startingValue = p0
	}
end