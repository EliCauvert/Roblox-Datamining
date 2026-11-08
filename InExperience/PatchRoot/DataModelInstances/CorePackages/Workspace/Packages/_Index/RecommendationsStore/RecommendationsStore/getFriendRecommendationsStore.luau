local Computed = require(script:FindFirstAncestor("RecommendationsStore").Parent.Signals).createComputed((require(script.Parent.createFriendRecommendationsStore)))

return function()
	-- upvalues: Computed (copy)
	return Computed(false)
end