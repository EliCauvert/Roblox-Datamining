local Computed = require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed((require(script.Parent.createFollowingStore)))

return {
	get = function() --[[ Line: 11 ]]
		-- upvalues: Computed (copy)
		return Computed(false)
	end
}