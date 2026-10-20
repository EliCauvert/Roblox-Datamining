local Computed = require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed((require(script.Parent.createFollowingStore)))

return {
	get = function()
		-- upvalues: Computed (copy)
		return Computed(false)
	end
}