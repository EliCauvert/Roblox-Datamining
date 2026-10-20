local Computed = require(script:FindFirstAncestor("HomeStore").Parent.Signals).createComputed((require(script.Parent.createFriendRecommendationsStore)))

return function()
	-- upvalues: Computed (copy)
	return Computed(false)
end