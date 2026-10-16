local Computed = require(script:FindFirstAncestor("HomeStore").Parent.Signals).createComputed((require(script.Parent.createFriendRecommendationsStore)))

return function() --[[ Line: 10 ]]
	-- upvalues: Computed (copy)
	return Computed(false)
end