local _ = require(script:FindFirstAncestor("ultimate-list").Parent.React)

return {
	byState = function(Callback, p1) --[[ Line: 20 ]]
		return { type = "byState", callback = Callback, config = p1 or {} }
	end,
	byBinding = function(Callback) --[[ Line: 28 ]]
		return { type = "byBinding", callback = Callback }
	end
}