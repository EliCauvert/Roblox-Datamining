local _ = require(script:FindFirstAncestor("ultimate-list").Parent.React)

return {
	byState = function(p0, p1) --[[ line: 20 ]]
		return { type = "byState", callback = p0, config = p1 or {} }
	end,
	byBinding = function(p2) --[[ line: 28 ]]
		return { type = "byBinding", callback = p2 }
	end
}