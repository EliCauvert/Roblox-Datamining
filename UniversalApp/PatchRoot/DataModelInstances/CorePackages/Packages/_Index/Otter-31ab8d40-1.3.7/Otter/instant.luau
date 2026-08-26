local _ = require(script.Parent.types)

return function(p1)
	return {
		step = function()
			-- upvalues: p1 (ref)
			return { complete = true, value = p1 }
		end,
		startingValue = p1
	}
end