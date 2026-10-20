local CreateProfileInsightsStoreModule = require(script.Parent.createProfileInsightsStore)
local Computed = require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: CreateProfileInsightsStoreModule (copy)
	return CreateProfileInsightsStoreModule()
end)

return {
	get = function()
		-- upvalues: Computed (copy)
		return Computed(false)
	end
}