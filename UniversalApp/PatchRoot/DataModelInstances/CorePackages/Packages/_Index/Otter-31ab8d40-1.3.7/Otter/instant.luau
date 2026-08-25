local _ = require(script.Parent.types)

return function(p0)
	return {
		step = function()
			-- upvalues: p0 (ref)
			return { complete = true, value = p0 }
		end,
		startingValue = p0
	}
end