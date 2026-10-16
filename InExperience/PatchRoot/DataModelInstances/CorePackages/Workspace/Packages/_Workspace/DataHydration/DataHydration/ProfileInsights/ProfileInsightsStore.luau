local CreateProfileInsightsStoreModule = require(script.Parent.createProfileInsightsStore)
local Computed = require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ Line: 8 ]]
	-- upvalues: CreateProfileInsightsStoreModule (copy)
	return CreateProfileInsightsStoreModule()
end)

return {
	get = function() --[[ Line: 13 ]]
		-- upvalues: Computed (copy)
		return Computed(false)
	end
}