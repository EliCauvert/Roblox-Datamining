local _ = require(script:FindFirstAncestor("ultimate-list").Parent.React)

return {
	byState = function(p1, p2)
		return { type = "byState", callback = p1, config = p2 or {} }
	end,
	byBinding = function(p1)
		return { type = "byBinding", callback = p1 }
	end
}