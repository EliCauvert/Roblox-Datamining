local var1 = require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(require(script.Parent.createFriendsRecommendationsStore))

return {
	get = function()
		-- upvalues: var1 (ref)
		return var1(false)
	end
}