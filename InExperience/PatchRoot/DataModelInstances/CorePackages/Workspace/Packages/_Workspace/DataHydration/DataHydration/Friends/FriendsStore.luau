local Computed = require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed((require(script.Parent.createFriendsStore)))

return {
	get = function() --[[ Line: 11 ]]
		-- upvalues: Computed (copy)
		return Computed(false)
	end
}