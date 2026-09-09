local var1 = require(script:FindFirstAncestor("HomeStore").Parent.Signals).createComputed(require(script.Parent.createFriendRecommendationsStore))

return function()
	-- upvalues: var1 (ref)
	return var1(false)
end